import Antlr4
import XCTest
@testable import SwiftyBibtex

final class BibtexPublicationListenerTests: XCTestCase {
    private static func parse(_ input: String, stringDefinitions: [String: String] = [:]) -> BibtexListener {
        let listener = BibtexListener(stringDefinitions: stringDefinitions.mapValues { ($0, 0, 0) }, loggingLevel: .none)
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

    // Warnings

    func testDuplicateCitationKeyWarning() {
        let input = """
        @Misc{citationKey,
            fieldName = "foo"
        }
        @Misc{citationKey,
            fieldName = "foo"
        }
        """
        Self.checkInput(input, produces: DuplicateCitationKeyWarning(citationKey: "citationKey", occurrences: [(1, 9), (4, 9)])!)
    }

    func testMismatchedDataTypeWarning() {
        let input = """
        @Misc{citationKey,
            year = {foo}
        }
        """
        let warnings = Self.parse(input).warnings
        XCTAssertEqual(warnings.count, 1)
        XCTAssert(warnings[0] is MismatchedDataTypeWarning)
        print((warnings[0] as! MismatchedDataTypeWarning).line)
        print((warnings[0] as! MismatchedDataTypeWarning).charPositionInLine)
        XCTAssertEqual(warnings[0] as! MismatchedDataTypeWarning, MismatchedDataTypeWarning(fieldName: "year", line: 2, charPositionInLine: 12, actualDataType: "String", expectedDataType: "Int"))
    }

    func testMissingRequiredFieldsWarning() {
        let input = """
        @Article{citationKey,
            title = {foo},
            year = {2020}
        }
        """
        Self.checkInput(input, produces: MissingRequiredFieldsWarning(citationKey: "citationKey", publicationType: .article, missingFields: ["author", "journal"]))
    }

    func testUnrecognizedPublicationTypeWarning() {
        let input = """
        @Code{citationKey,
            title = {SwiftyBibtex}
        }
        """
        Self.checkInput(input, produces: UnrecognizedPublicationTypeWarning(citationKey: "citationKey", publicationType: "Code", line: 1, charPositionInLine: 0))
    }

    func testUnusedStringDefinitionWarning() {
        Self.checkInput("@String{foo = \"bar\"}", stringDefinitions: ["foo": "bar"], produces: UnusedStringDefinitionWarning(name: "foo", line: 0, charPositionInLine: 0))
    }

    private static func checkInput<T: ParserWarning & Equatable>(_ input: String, stringDefinitions: [String: String] = [:], produces expectedWarning: T) {
        let warnings = Self.parse(input, stringDefinitions: stringDefinitions).warnings
        XCTAssertEqual(warnings.count, 1, "Input produced no or more than one warning.")
        XCTAssert(warnings[0] is T, "Warning of type \(type(of: warnings[0])) is not of type \(T.self)")
        XCTAssertEqual(warnings[0] as! T, expectedWarning)
    }

    // Errors

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

    // Utils
    
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
