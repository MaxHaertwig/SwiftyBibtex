import XCTest
@testable import SwiftyBibtex

final class UnusedStringDefinitionWarningTests: XCTestCase {
    func testMessage() {
        let warning = UnusedStringDefinitionWarning(name: "foo", line: 1, charPositionInLine: 2)
        XCTAssertEqual(warning.message, "Unused string definition \"foo\" on (1:2).")
    }
}
