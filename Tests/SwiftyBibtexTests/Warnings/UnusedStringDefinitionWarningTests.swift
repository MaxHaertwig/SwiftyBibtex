import XCTest
@testable import SwiftyBibtex

final class UnusedStringDefinitionWarningTests: XCTestCase {
    func testMessage() {
        let warning = UnusedStringDefinitionWarning(name: "foo", positionInFile: PositionInFile(1, 2))
        XCTAssertEqual(warning.message, "Unused string definition \"foo\" on (1:2).")
    }
}
