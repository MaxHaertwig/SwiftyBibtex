import XCTest
@testable import SwiftyBibtex

final class ExtraneousInputParserErrorTests: XCTestCase {
    func testMessage() {
        let error = ExtraneousInputParserError(line: 1, charPositionInLine: 2, offendingSymbol: ",", expectedSymbols: ["'@'"])
        XCTAssertEqual(error.message, "extraneous input ',' expecting '@'")
    }
}
