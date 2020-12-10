import Antlr4
import XCTest
@testable import SwiftyBibtex

final class BibtexPublicationListenerTests: XCTestCase {
    private static func parse(_ input: String, stringDefinitions: [String: String] = [:]) -> [ParsedPublication] {
        let listener = BibtexListener(stringDefinitions: stringDefinitions)
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
            fieldName = {fieldValue}
        }
        """
        let publications = Self.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], ParsedPublication(type: "Article", citationKey: "citationKey", fields: ["fieldName": "fieldValue"]))
    }
    
    func testPublicationWithTwoFields() {
        let input = """
        @Article{citationKey,
            fieldName = {fieldValue},
            fieldName2 = \"fieldValue2\"
        }
        """
        let publications = Self.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], ParsedPublication(type: "Article", citationKey: "citationKey", fields: ["fieldName": "fieldValue", "fieldName2": "fieldValue2"]))
    }
    
    func testFieldValues() {
        for fieldValue in ["abc", " abc    ", " { abc   }   ", " { abc {   def}   }   "] {
            testCurlyFieldValue(fieldValue)
            testQuotedFieldValue(fieldValue)
        }
        testCurlyFieldValue(" \"ab \"  { \"\"} c")
    }
    
    func testFieldValueConcat() {
        testFieldValue("\"a\" # \"  b \"   # \" c\"", expected: "a  b  c")
    }

    func testFillInStringDefinition() {
        let input = """
        @Article{citationKey,
            fieldName = foo # "Baz"
        }
        """
        let publications = Self.parse(input, stringDefinitions: ["foo": "bar"])
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], ParsedPublication(type: "Article", citationKey: "citationKey", fields: ["fieldName": "barBaz"]))
    }

    func testParantheses() {
        let input = """
        @Article(citationKey,
            fieldName = "foo"
        )
        """
        let publications = Self.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], ParsedPublication(type: "Article", citationKey: "citationKey", fields: ["fieldName": "foo"]))
    }

    func testPreambles() {
        let input = """
        @preamble {"foo"}
        @PrEaMbLe( " bar bazz {}  "  )
        """

        let bibtexParser = SwiftyBibtex.parser(for: input)
        let listener = BibtexListener()
        try! ParseTreeWalker().walk(listener, try! bibtexParser.root())
        XCTAssertEqual(listener.preambles, ["foo", " bar bazz {}  "])
    }

    func testComments() {
        let input = """
        @comment {foo bar}
        @CoMMent( foo @{}{{}} = bar ""    )
        """

        let bibtexParser = SwiftyBibtex.parser(for: input)
        let listener = BibtexListener()
        try! ParseTreeWalker().walk(listener, try! bibtexParser.root())
        XCTAssertEqual(listener.comments, ["foo bar", " foo @{}{{}} = bar \"\"    "])
    }
    
    private func testCurlyFieldValue(_ fieldValue: String) {
        testFieldValue("{\(fieldValue)}", expected: fieldValue)
    }
    
    private func testQuotedFieldValue(_ fieldValue: String) {
        testFieldValue("\"\(fieldValue)\"", expected: fieldValue)
    }
    
    private func testFieldValue(_ fieldValue: String, expected: String) {
        let input = """
        @Article{citationKey,
            fieldName = \(fieldValue)
        }
        """
        let publications = Self.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0].fields, ["fieldname": expected])
    }

    static var allTests = [
        ("testSimplePublication", testSimplePublication),
        ("testPublicationWithTwoFields", testPublicationWithTwoFields),
        ("testFieldValues", testFieldValues),
        ("testFieldValueConcat", testFieldValueConcat),
        ("testFillInStringDefinition", testFillInStringDefinition),
        ("testParantheses", testParantheses),
        ("testPreambles", testPreambles),
        ("testComments", testComments)
    ]
}
