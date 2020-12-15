import XCTest
@testable import SwiftyBibtex

final class MissingRequiredFieldsWarningTests: XCTestCase {
    func testMessage() {
        let warningOneMissingField = MissingRequiredFieldsWarning(citationKey: "key", publicationType: .article, missingFields: ["author"])
        XCTAssertEqual(warningOneMissingField.message, "The publication \"key\" of type Article is missing the required field author.")

        let warningTwoMissingFields = MissingRequiredFieldsWarning(citationKey: "key", publicationType: .article, missingFields: ["author", "title"])
        XCTAssertEqual(warningTwoMissingFields.message, "The publication \"key\" of type Article is missing the required fields author and title.")

        let warningThreeMissingFields = MissingRequiredFieldsWarning(citationKey: "key", publicationType: .article, missingFields: ["author", "title", "year"])
        XCTAssertEqual(warningThreeMissingFields.message, "The publication \"key\" of type Article is missing the required fields author, title, and year.")
    }
}
