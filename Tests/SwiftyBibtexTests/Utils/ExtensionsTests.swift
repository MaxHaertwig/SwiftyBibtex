import XCTest
@testable import SwiftyBibtex

final class ExtensionsTests: XCTestCase {
    func testDictionaryMonth() {
        let yearDictionary = ["year": "2020"]
        XCTAssertNil(yearDictionary.month)
        let monthDictionary = ["month": "nov"]
        XCTAssertEqual(monthDictionary.month, .november)
    }
    func testDictionaryYear() {
        let yearDictionary = ["year": "2020"]
        XCTAssertEqual(yearDictionary.year, 2020)
        let monthDictionary = ["month": "nov"]
        XCTAssertNil(monthDictionary.year)
    }

    static var allTests = [
        ("testDictionaryMonth", testDictionaryMonth),
        ("testDictionaryYear", testDictionaryYear)
    ]
}
