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
        @Preamble{"bar" # foo}
        @Comment(bar)
        error
        """
        let result = try! SwiftyBibtex.parse(input)
        XCTAssertEqual(result.publications.count, 1)
        
        let publication = result.publications[0]
        XCTAssertEqual(publication.publicationType, .article)
        XCTAssertEqual(publication.citationKey, "citationKey")
        XCTAssertEqual(publication.fields, ["field1": "a", "field2": "b {b} b", "field3": "cc"])

        XCTAssertEqual(result.preambles, ["barc"])
        XCTAssertEqual(result.comments, ["bar"])

        XCTAssertEqual(result.errors.count, 1)
        XCTAssertEqual(result.errors[0].line, 9)
        XCTAssertEqual(result.errors[0].charPositionInLine, 0)
    }
    
    static var allTests = [
        ("testComplexExample", testComplexExample)
    ]
}
