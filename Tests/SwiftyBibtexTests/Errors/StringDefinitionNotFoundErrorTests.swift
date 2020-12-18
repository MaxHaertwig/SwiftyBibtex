import Foundation
import XCTest
@testable import SwiftyBibtex

final class StringDefinitionNotFoundParserErrorTests: XCTestCase {
    func testMessage() {
        let error = StringDefinitionNotFoundParserError(positionInFile: PositionInFile(1, 2), string: "foo")
        XCTAssertEqual(error.message, "Definition for string \"foo\" couldn't be found.")
    }
}
