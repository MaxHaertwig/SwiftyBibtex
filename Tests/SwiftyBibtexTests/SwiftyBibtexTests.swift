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
    
    func testTagValues() {
        for tagValue in ["abc", " abc    ", " { abc   }   ", " { abc {   def}   }   "] {
            testCurlyTagValue(tagValue)
            testQuotedTagValue(tagValue)
        }
        testCurlyTagValue(" \"ab \"  { \"\"} c")
    }
    
    func testTagValueConcat() {
        testTagValue("\"a\" # \"  b \"   # \" c\"", expected: "a  b  c")
    }
    
    private func testCurlyTagValue(_ tagValue: String) {
        testTagValue("{\(tagValue)}", expected: tagValue)
    }
    
    private func testQuotedTagValue(_ tagValue: String) {
        testTagValue("\"\(tagValue)\"", expected: tagValue)
    }
    
    private func testTagValue(_ tagValue: String, expected: String) {
        let input = """
        @Entry{citationKey,
            tagName = \(tagValue)
        }
        """
        let entries = try! SwiftyBibtex.parse(input)
        XCTAssertEqual(entries.count, 1)
        XCTAssertEqual(entries[0].tags, ["tagname": expected])
    }

    static var allTests = [
        ("testSimpleEntry", testSimpleEntry),
        ("testEntryWithTwoTags", testEntryWithTwoTags)
    ]
}
