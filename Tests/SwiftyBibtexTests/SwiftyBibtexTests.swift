import XCTest
@testable import SwiftyBibtex

final class SwiftyBibtexTests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testSimplePublication() {
        let input = """
        @Article{citationKey,
            tagName = {tagValue}
        }
        """
        let publications = try! SwiftyBibtex.parse(input)
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
        let publications = try! SwiftyBibtex.parse(input)
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
        let publications = try! SwiftyBibtex.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0].tags, ["tagname": expected])
    }

    static var allTests = [
        ("testSimplePublication", testSimplePublication),
        ("testPublicationWithTwoTags", testPublicationWithTwoTags)
    ]
}
