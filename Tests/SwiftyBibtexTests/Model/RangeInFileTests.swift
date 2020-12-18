import XCTest
@testable import SwiftyBibtex

final class RangeInFileTests: XCTestCase {
    func testDescription() {
        XCTAssertEqual(RangeInFile((1, 5), (3, 2)).description, "(1:5)...(3:2)")
    }

    static var allTests = [
        ("testDescription", testDescription)
    ]
}
