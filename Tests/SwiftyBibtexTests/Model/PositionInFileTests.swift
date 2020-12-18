import XCTest
@testable import SwiftyBibtex

final class PositionInFileTests: XCTestCase {
    func testDescription() {
        XCTAssertEqual(PositionInFile(3, 24).description, "(3:24)")
    }

    static var allTests = [
        ("testDescription", testDescription)
    ]
}
