import XCTest
@testable import SwiftyBibtex

final class MonthTests: XCTestCase {
    func testRawValue() {
        XCTAssertEqual(Month.allCases.map(\.rawValue), Array(1...12))
    }
    
    func testStringInitializer() {
        let testData: [Month: (String, String, String)] = [
            .january: ("jan", "january", "JaNuArY"),
            .february: ("feb", "february", "FeBrUaRy"),
            .march: ("mar", "march", "MaRcH"),
            .april: ("apr", "april", "ApRiL"),
            .may: ("may", "MaY", "mAy"),
            .june: ("jun", "june", "JuNe"),
            .july: ("jul", "july", "JuLy"),
            .august: ("aug", "august", "AuGuSt"),
            .september: ("sep", "september", "SePtEmBeR"),
            .october: ("oct", "october", "OcToBeR"),
            .november: ("nov", "november", "NoVeMbEr"),
            .december: ("dec", "december", "DeCeMbEr"),
        ]
        for (month, strings) in testData {
            XCTAssertEqual(Month(strings.0), month)
            XCTAssertEqual(Month(strings.1), month)
            XCTAssertEqual(Month(strings.2), month)
        }
    }

    func testDescription() {
        for monthName in ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] {
            XCTAssertEqual(Month(monthName)!.description, monthName)
        }
    }

    static var allTests = [
        ("testRawValue", testRawValue),
        ("testStringInitializer", testStringInitializer),
        ("testDescription", testDescription)
    ]
}
