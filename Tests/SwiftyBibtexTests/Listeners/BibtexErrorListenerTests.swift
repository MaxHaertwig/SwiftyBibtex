import Antlr4
import XCTest
@testable import SwiftyBibtex

final class BibtexErrorListenerTests: XCTestCase {
    private static func checkInput<T: ParserError & Equatable>(_ input: String, produces expectedError: T) {
        let errors = Self.errorsWhenParsing(input)
        XCTAssertEqual(errors.count, 1, "Input produced more than one error.")
        XCTAssert(errors[0] is T, "Error of type \(type(of: errors[0])) is not of type \(T.self)")
        XCTAssertEqual(errors[0] as! T, expectedError)
    }

    private static func errorsWhenParsing(_ input: String) -> [ParserError] {
        let errorListener = BibtexErrorListener()
        let bibtexParser = SwiftyBibtex.parser(for: input, errorListener: errorListener)
        try! ParseTreeWalker().walk(BibtexListener(), try! bibtexParser.root())
        return errorListener.errors
    }

    override func setUp() {
        continueAfterFailure = false
    }

    // Extraneous Input

    func testArbitraryString() {
        Self.checkInput("foo", produces: ExtraneousInputParserError(line: 1, charPositionInLine: 0, offendingSymbol: "foo", expectedSymbols: ["<EOF>"]))
    }

    // Mismatched Input

    func testMissingCitationKey() {
        let input = """
        @Article{
            author={Max}
        }
        """
        Self.checkInput(input, produces: MismatchedInputParserError(line: 2, charPositionInLine: 10, offendingSymbol: "={", expectedSymbols: ["','"]))
    }

    func testDoubleEquals() {
        let input = """
        @Article{key,
            author=={Max}
        }
        """
        Self.checkInput(input, produces: MismatchedInputParserError(line: 2, charPositionInLine: 11, offendingSymbol: "={", expectedSymbols: ["Name", "String Literal"]))
    }

    // Missing Symbol

    func testMissingClosingCurly() {
        let input = """
        @Article{key,
            author={{Max}
        }
        """
        Self.checkInput(input, produces: MissingSymbolParserError(line: 3, charPositionInLine: 1, missingSymbol: "'}'", location: "<EOF>"))
    }

    // No Viable Alternative

    func testMissingValue() {
        let input = """
        @Article{key,
            title,
            author={Max}
        }
        """
        Self.checkInput(input, produces: NoViableAlternativeParserError(line: 2, charPositionInLine: 9, offendingSymbol: "title,"))
    }

    // Token Recognition

    func testInvalidInput() {
        Self.checkInput("你", produces: TokenRecognitionParserError(line: 1, charPositionInLine: 0, offendingSymbol: "你"))
    }

    static var allTests = [
        ("testArbitraryString", testArbitraryString),
        ("testMissingCitationKey", testMissingCitationKey),
        ("testDoubleEquals", testDoubleEquals),
        ("testMissingClosingCurly", testMissingClosingCurly),
        ("testMissingValue", testMissingValue),
        ("testInvalidInput", testInvalidInput)
    ]
}
