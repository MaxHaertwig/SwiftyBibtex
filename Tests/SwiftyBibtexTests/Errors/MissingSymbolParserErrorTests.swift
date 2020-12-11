import XCTest
@testable import SwiftyBibtex

final class MissingSymbolParserErrorTests: XCTestCase {
    func testMessage() {
        let error = MissingSymbolParserError(line: 1, charPositionInLine: 2, missingSymbol: "','", location: "<EOF>")
        XCTAssertEqual(error.message, "missing ',' at '<EOF>'")
    }
}