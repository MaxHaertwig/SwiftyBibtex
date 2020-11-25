import XCTest
@testable import SwiftyBibtex

final class SwiftyBibtexTests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testComplexExample() {
        let input = """
        @Article{citationKey,
            tag1 = {a},
            tag2 = {b {b} b},
            tag3 = "c" # foo
        }
        @String{foo = "c"}
        """
        let publications = try! SwiftyBibtex.parse(input)
        XCTAssertEqual(publications.count, 1)
        XCTAssertEqual(publications[0], Publication(type: "Article", citationKey: "citationKey", tags: ["tag1": "a", "tag2": "b {b} b", "tag3": "cc"]))
    }
    
    static var allTests = [
        ("testComplexExample", testComplexExample)
    ]
}
