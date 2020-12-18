import XCTest
@testable import SwiftyBibtex

final class TokenRecognitionParserErrorTests: XCTestCase {
    func testMessage() {
        let error = TokenRecognitionParserError(positionInFile: PositionInFile(1, 2), offendingSymbol: "你")
        XCTAssertEqual(error.message, "Token recognition error at '你'")
    }
}
