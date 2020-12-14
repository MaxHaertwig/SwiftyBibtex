import XCTest
@testable import SwiftyBibtex

final class TokenRecognitionParserErrorTests: XCTestCase {
    func testMessage() {
        let error = TokenRecognitionParserError(line: 1, charPositionInLine: 2, offendingSymbol: "你")
        XCTAssertEqual(error.message, "Token recognition error at '你'")
    }
}
