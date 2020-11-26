import XCTest
@testable import SwiftyBibtex

final class SwiftyBibtexTests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testComplexExample() {
        let input = """
        @Article{citationKey,
            field1 = {a},
            field2 = {b {b} b},
            field3 = "c" # foo
        }
        @String{foo = "c"}
        """
        let publications = try! SwiftyBibtex.parse(input)
        XCTAssertEqual(publications.count, 1)
        
        let publication = publications[0]
        XCTAssertEqual(publication.publicationType, .article)
        XCTAssertEqual(publication.citationKey, "citationKey")
        XCTAssertEqual(publication.fields, ["field1": "a", "field2": "b {b} b", "field3": "cc"])
    }
    
    static var allTests = [
        ("testComplexExample", testComplexExample)
    ]
}
