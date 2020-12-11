import XCTest
@testable import SwiftyBibtex

final class MismatchedInputParserErrorTests: XCTestCase {
    func testMessage() {
        let error = MismatchedInputParserError(line: 1, charPositionInLine: 2, offendingSymbol: ",", expectedSymbols: ["'@'"])
        XCTAssertEqual(error.message, "mismatched input ',' expecting '@'")
    }
}
