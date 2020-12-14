import Antlr4
import XCTest
@testable import SwiftyBibtex

final class BibtexPublicationListenerTests: XCTestCase {
    private static func parse(_ input: String, stringDefinitions: [String: String] = [:]) -> BibtexListener {
        let listener = BibtexListener(stringDefinitions: stringDefinitions)
        let bibtexParser = SwiftyBibtex.parser(for: input)
        try! ParseTreeWalker().walk(listener, try! bibtexParser.root())
        return listener
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
        let publications = Self.parse(input).publications
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
        let publications = Self.parse(input).publications
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
        let publications = Self.parse(input, stringDefinitions: ["foo": "bar"]).publications
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], ParsedPublication(type: "Article", citationKey: "citationKey", fields: ["fieldName": "barBaz"]))
    }

    func testParantheses() {
        let input = """
        @Article(citationKey,
            fieldName = "foo"
        )
        """
        let publications = Self.parse(input).publications
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], ParsedPublication(type: "Article", citationKey: "citationKey", fields: ["fieldName": "foo"]))
    }

    func testPreambles() {
        let input = """
        @preamble {"foo"}
        @PrEaMbLe( " bar bazz {}  "  )
        """
        XCTAssertEqual(Self.parse(input).preambles, ["foo", " bar bazz {}  "])
    }

    func testComments() {
        let input = """
        @comment {foo bar}
        @CoMMent( foo @{}{{}} = bar ""    )
        """
        XCTAssertEqual(Self.parse(input).comments, ["foo bar", " foo @{}{{}} = bar \"\"    "])
    }

    func testMultilineFields() {
        let input = """
        @Article{citationKey,
            fieldName = {foo
                    bar
                    baz}
        }
        """
        let publications = Self.parse(input).publications
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], ParsedPublication(type: "Article", citationKey: "citationKey", fields: ["fieldName": "foo bar baz"]))
    }

    func testStringDefinitionNotFoundParserError() {
        let input = """
        @Article{citationKey,
            fieldName = foo # "bar" # baz
        }
        """
        let errors = Self.parse(input).errors
        XCTAssertEqual(errors.count, 2)
        XCTAssert(errors[0] is StringDefinitionNotFoundParserError && errors[1] is StringDefinitionNotFoundParserError)
        XCTAssertEqual(errors[0] as! StringDefinitionNotFoundParserError, StringDefinitionNotFoundParserError(line: 2, charPositionInLine: 16, string: "foo"))
        XCTAssertEqual(errors[1] as! StringDefinitionNotFoundParserError, StringDefinitionNotFoundParserError(line: 2, charPositionInLine: 30, string: "baz"))
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
        let publications = Self.parse(input).publications
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
        ("testComments", testComments),
        ("testMultilineFields", testMultilineFields)
    ]
}
