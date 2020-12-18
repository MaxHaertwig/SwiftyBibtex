import XCTest
@testable import SwiftyBibtex

final class UnrecognizedPublicationTypeWarningTests: XCTestCase {
    func testMessage() {
        let warning = UnrecognizedPublicationTypeWarning(citationKey: "key", publicationType: "code", positionInFile: PositionInFile(1, 2))
        XCTAssertEqual(warning.message, "The publication \"key\" has an unrecognized type: code.")
    }
}
