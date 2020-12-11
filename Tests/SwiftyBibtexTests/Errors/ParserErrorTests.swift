import XCTest
@testable import SwiftyBibtex

final class ParserErrorTests: XCTestCase {
    func testDescription() {
        let error = UnknownParserError(line: 1, charPositionInLine: 2, message: "error")
        XCTAssertEqual(error.description, "line 1:2 error")
    }
}
