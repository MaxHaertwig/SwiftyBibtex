import XCTest
@testable import SwiftyBibtex

final class SwiftyBibtexTests: XCTestCase {
    func testSimpleEntry() {
        let input = """
        @Entry{citationKey,
            tagName = {tagValue}
        }
        """
        let entries = try! SwiftyBibtex.parse(input)
        XCTAssertEqual(entries.count, 1)
        XCTAssertEqual(entries[0], Entry(type: "Entry", citationKey: "citationKey", tags: ["tagName": "tagValue"]))
    }
    
    func testEntryWithTwoTags() {
        let input = """
        @Entry{citationKey,
            tagName = {tagValue},
            tagName2 = \"tagValue2\"
        }
        """
        let entries = try! SwiftyBibtex.parse(input)
        XCTAssertEqual(entries.count, 1)
        XCTAssertEqual(entries[0], Entry(type: "Entry", citationKey: "citationKey", tags: ["tagName": "tagValue", "tagName2": "tagValue2"]))
    }

    static var allTests = [
        ("testSimpleEntry", testSimpleEntry),
        ("testEntryWithTwoTags", testEntryWithTwoTags)
    ]
}
