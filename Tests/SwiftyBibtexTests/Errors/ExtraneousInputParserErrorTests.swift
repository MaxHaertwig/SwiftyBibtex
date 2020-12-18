import XCTest
@testable import SwiftyBibtex

final class ExtraneousInputParserErrorTests: XCTestCase {
    func testMessage() {
        let error = ExtraneousInputParserError(positionInFile: PositionInFile(1, 2), offendingSymbol: ",", expectedSymbols: ["'@'"])
        XCTAssertEqual(error.message, "Extraneous input ',' expecting '@'")
    }
}
