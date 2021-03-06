import Antlr4
import BibtexParser
import XCTest
@testable import SwiftyBibtex

final class BibtexStringListenerTests: XCTestCase {
    func testDefinitions() {
        let input = """
        @string { foo = "bar" }
        @StrINg(fooBar = " baz  "    )
        """
        
        let bibtexParser = SwiftyBibtex.parser(for: input)
        let listener = BibtexStringListener()
        try! ParseTreeWalker().walk(listener, try! bibtexParser.root())
        XCTAssertEqual(listener.definitions.count, 2)
        XCTAssertEqual(listener.definitions["foo"]!.replacement, "bar")
        XCTAssertEqual(listener.definitions["foo"]!.position, PositionInFile(1, 0))
        XCTAssertEqual(listener.definitions["fooBar"]!.replacement, " baz  ")
        XCTAssertEqual(listener.definitions["fooBar"]!.position, PositionInFile(2, 0))
    }

    static var allTests = [
        ("testDefinitions", testDefinitions)
    ]
}
