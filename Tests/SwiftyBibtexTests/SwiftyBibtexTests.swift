import Foundation
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
        let result = try! SwiftyBibtex.parse(input, loggingLevel: .none)
        XCTAssertEqual(result.publications.count, 1)
        
        let publication = result.publications[0]
        XCTAssertEqual(publication.publicationType, .article)
        XCTAssertEqual(publication.citationKey, "citationKey")
        XCTAssertEqual(publication.fields, ["field1": "a", "field2": "b {b} b", "field3": "cc"])

        XCTAssertEqual(result.preambles, ["barc"])
        XCTAssertEqual(result.comments, ["bar"])

        XCTAssertEqual(result.errors.count, 1)
        XCTAssertEqual(result.errors[0] as! ExtraneousInputParserError, ExtraneousInputParserError(positionInFile: PositionInFile(9, 0), offendingSymbol: "error", expectedSymbols: ["<EOF>"]))
    }

    func testExamples() {
        let examples = [
            ("Example1", 53, 0, 1),
            ("Example2", 97, 0, 0),
            ("Example3", 275, 0, 1)
        ]
        for (fileName, publications, preambles, comments) in examples {
            let url = Bundle.module.url(forResource: fileName, withExtension: "bib", subdirectory: "Resources")!
            let input = try! String(contentsOf: url)
            let result = try! SwiftyBibtex.parse(input, loggingLevel: .none)
            XCTAssertEqual(result.publications.count, publications)
            XCTAssertEqual(result.preambles.count, preambles)
            XCTAssertEqual(result.comments.count, comments)
            XCTAssertEqual(result.errors.count, 0)
        }
    }

    func testRangeInFileExample1() {
        let url = Bundle.module.url(forResource: "Example1", withExtension: "bib", subdirectory: "Resources")!
        let input = try! String(contentsOf: url)
        let result = try! SwiftyBibtex.parse(input, loggingLevel: .none)
        let keysAndRanges = result.publications.map { ($0.citationKey, $0.rangeInFile) }
        let expectations = [
            ("Eastman2008", RangeInFile((1, 0), (11, 0))),
            ("Lee2006", RangeInFile((13, 0), (33, 0))),
            ("Azhar2011b", RangeInFile((35, 0), (47, 0))),
            ("Volk2014", RangeInFile((49, 0), (61, 0))),
            ("Goedert2008", RangeInFile((63, 0), (86, 0)))
        ]
        for expectation in expectations {
            XCTAssert(keysAndRanges.contains { $0.0 == expectation.0 && $0.1 == expectation.1 })
        }
    }
    
    static var allTests = [
        ("testComplexExample", testComplexExample),
        ("testExamples", testExamples),
        ("testRangeInFileExample1", testRangeInFileExample1)
    ]
}
