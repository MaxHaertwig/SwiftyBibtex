import XCTest
@testable import SwiftyBibtex

final class MismatchedInputParserErrorTests: XCTestCase {
    func testMessage() {
        let error = MismatchedInputParserError(positionInFile: PositionInFile(1, 2), offendingSymbol: ",", expectedSymbols: ["'@'"])
        XCTAssertEqual(error.message, "Mismatched input ',' expecting '@'")
    }
}
