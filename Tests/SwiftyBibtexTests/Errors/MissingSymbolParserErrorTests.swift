import XCTest
@testable import SwiftyBibtex

final class MissingSymbolParserErrorTests: XCTestCase {
    func testMessage() {
        let error = MissingSymbolParserError(positionInFile: PositionInFile(1, 2), missingSymbol: "','", location: "<EOF>")
        XCTAssertEqual(error.message, "Missing ',' at '<EOF>'")
    }
}
