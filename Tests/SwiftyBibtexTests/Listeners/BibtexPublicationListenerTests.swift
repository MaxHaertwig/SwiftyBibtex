import Antlr4
import XCTest
@testable import SwiftyBibtex

final class BibtexPublicationListenerTests: XCTestCase {
    private static func parse(_ input: String, stringDefinitions: [String: String] = [:]) -> [Publication] {
        let listener = BibtexPublicationListener(stringDefinitions: stringDefinitions)
        let bibtexParser = SwiftyBibtex.parser(for: input)
        try! ParseTreeWalker().walk(listener, try! bibtexParser.root())
        return listener.publications
    }
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testSimplePublication() {
        let input = """
        @Article{citationKey,
            tagName = {tagValue}
        }
        """
        let publications = Self.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], Publication(type: "Article", citationKey: "citationKey", tags: ["tagName": "tagValue"]))
    }
    
    func testPublicationWithTwoTags() {
        let input = """
        @Article{citationKey,
            tagName = {tagValue},
            tagName2 = \"tagValue2\"
        }
        """
        let publications = Self.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], Publication(type: "Article", citationKey: "citationKey", tags: ["tagName": "tagValue", "tagName2": "tagValue2"]))
    }
    
    func testTagValues() {
        for tagValue in ["abc", " abc    ", " { abc   }   ", " { abc {   def}   }   "] {
            testCurlyTagValue(tagValue)
            testQuotedTagValue(tagValue)
        }
        testCurlyTagValue(" \"ab \"  { \"\"} c")
    }
    
    func testTagValueConcat() {
        testTagValue("\"a\" # \"  b \"   # \" c\"", expected: "a  b  c")
    }
    
    func testFillInStringDefinition() {
        let input = """
        @Article{citationKey,
            tagName = foo # "Baz"
        }
        """
        let publications = Self.parse(input, stringDefinitions: ["foo": "bar"])
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], Publication(type: "Article", citationKey: "citationKey", tags: ["tagName": "barBaz"]))
    }
    
    private func testCurlyTagValue(_ tagValue: String) {
        testTagValue("{\(tagValue)}", expected: tagValue)
    }
    
    private func testQuotedTagValue(_ tagValue: String) {
        testTagValue("\"\(tagValue)\"", expected: tagValue)
    }
    
    private func testTagValue(_ tagValue: String, expected: String) {
        let input = """
        @Article{citationKey,
            tagName = \(tagValue)
        }
        """
        let publications = Self.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0].tags, ["tagname": expected])
    }

    static var allTests = [
        ("testSimplePublication", testSimplePublication),
        ("testPublicationWithTwoTags", testPublicationWithTwoTags),
        ("testTagValues", testTagValues),
        ("testTagValueConcat", testTagValueConcat),
        ("testFillInStringDefinition", testFillInStringDefinition)
    ]
}
