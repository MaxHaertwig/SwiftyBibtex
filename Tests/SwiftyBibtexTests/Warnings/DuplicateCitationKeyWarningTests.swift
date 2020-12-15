import XCTest
@testable import SwiftyBibtex

final class DuplicateCitationKeyWarningTests: XCTestCase {
    func testInitializer() {
        XCTAssertNil(DuplicateCitationKeyWarning(citationKey: "key", occurrences: [(1, 2)]))
        XCTAssertNotNil(DuplicateCitationKeyWarning(citationKey: "key", occurrences: [(1, 2), (3, 4)]))
    }

    func testMessage() {
        let warningTwoOccurrences = DuplicateCitationKeyWarning(citationKey: "key", occurrences: [(1, 2), (3, 4)])!
        XCTAssertEqual(warningTwoOccurrences.message, "Duplicate citation key \"key\" found on (1:2) and (3:4).")
        let warningThreeOccurrences = DuplicateCitationKeyWarning(citationKey: "key", occurrences: [(1, 2), (3, 4), (5, 6)])!
        XCTAssertEqual(warningThreeOccurrences.message, "Duplicate citation key \"key\" found on (1:2), (3:4), and (5:6).")
    }
}
