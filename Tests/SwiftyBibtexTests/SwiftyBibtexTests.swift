import XCTest
@testable import SwiftyBibtex

final class SwiftyBibtexTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftyBibtex().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
