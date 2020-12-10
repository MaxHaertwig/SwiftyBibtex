import Antlr4
import BibtexParser
import XCTest
@testable import SwiftyBibtex

final class BibtexCommentListenerTests: XCTestCase {
    func testComments() {
        let input = """
        @comment {foo bar}
        @CoMMent( foo @{}{{}} = bar ""    )
        """

        let bibtexParser = SwiftyBibtex.parser(for: input)
        let listener = BibtexCommentListener()
        try! ParseTreeWalker().walk(listener, try! bibtexParser.root())
        XCTAssertEqual(listener.comments, ["foo bar", " foo @{}{{}} = bar \"\"    "])
    }

    static var allTests = [
        ("testComments", testComments)
    ]
}
