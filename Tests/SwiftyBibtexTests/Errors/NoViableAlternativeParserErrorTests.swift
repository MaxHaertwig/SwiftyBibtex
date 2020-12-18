import XCTest
@testable import SwiftyBibtex

final class NoViableAlternativeParserErrorTests: XCTestCase {
    func testMessage() {
        let error = NoViableAlternativeParserError(positionInFile: PositionInFile(1, 2), offendingSymbol: ",")
        XCTAssertEqual(error.message, "No viable alternative at input ','")
    }
}
