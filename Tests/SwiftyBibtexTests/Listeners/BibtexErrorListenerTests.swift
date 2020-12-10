import Antlr4
import XCTest
@testable import SwiftyBibtex

final class BibtexErrorListenerTests: XCTestCase {
    private static func parse(_ input: String) -> [BibtexParserError] {
        let errorListener = BibtexErrorListener()
        let bibtexParser = SwiftyBibtex.parser(for: input, errorListener: errorListener)
        try! ParseTreeWalker().walk(BibtexListener(), try! bibtexParser.root())
        return errorListener.errors
    }

    override func setUp() {
        continueAfterFailure = false
    }

    func testArbitraryString() {
        let errors = Self.parse("foo")
        XCTAssertEqual(errors.count, 1)
        XCTAssertEqual(errors[0].line, 1)
        XCTAssertEqual(errors[0].charPositionInLine, 0)
    }

    func testMissingCitationKey() {
        let input = """
        @Article{
            author={Max}
        }
        """
        let errors = Self.parse(input)
        XCTAssertEqual(errors.count, 1)
        print(errors[0])
        XCTAssertEqual(errors[0].line, 2)
        XCTAssertEqual(errors[0].charPositionInLine, 10)
    }

    static var allTests = [
        ("testArbitraryString", testArbitraryString),
        ("testMissingCitationKey", testMissingCitationKey)
    ]
}
