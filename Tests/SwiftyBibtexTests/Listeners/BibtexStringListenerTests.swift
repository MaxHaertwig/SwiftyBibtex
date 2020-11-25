import Antlr4
import BibtexParser
import XCTest
@testable import SwiftyBibtex

final class BibtexStringListenerTests: XCTestCase {
    func testDefinitions() {
        let input = """
        @string { foo = "bar" }
        @StrINg{fooBar = " baz  "    }
        """
        
        let bibtexParser = SwiftyBibtex.parser(for: input)
        let listener = BibtexStringListener()
        try! ParseTreeWalker().walk(listener, try! bibtexParser.root())
        XCTAssertEqual(listener.definitions, ["foo": "bar", "fooBar": " baz  "])
    }

    static var allTests = [
        ("testDefinitions", testDefinitions)
    ]
}
