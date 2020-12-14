import XCTest
@testable import SwiftyBibtex

final class NoViableAlternativeParserErrorTests: XCTestCase {
    func testMessage() {
        let error = NoViableAlternativeParserError(line: 1, charPositionInLine: 2, offendingSymbol: ",")
        XCTAssertEqual(error.message, "No viable alternative at input ','")
    }
}
