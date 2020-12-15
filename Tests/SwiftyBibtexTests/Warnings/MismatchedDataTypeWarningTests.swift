import XCTest
@testable import SwiftyBibtex

final class MismatchedDataTypeWarningTests: XCTestCase {
    func testMessage() {
        let warning = MismatchedDataTypeWarning(fieldName: "year", line: 1, charPositionInLine: 2, actualDataType: "String", expectedDataType: "Int")
        XCTAssertEqual(warning.message, "Mismatched data type for field \"year\": String, expected Int.")
    }
}
