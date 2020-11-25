import Antlr4
import BibtexParser

struct SwiftyBibtex {
    static func parse(_ input: String) throws -> [Publication] {
        let listener = BibtexPublicationListener()
        let bibtexParser = parser(for: input)
        try ParseTreeWalker().walk(listener, try! bibtexParser.root())
        return listener.publications
    }
    
    internal static func parser(for input: String) -> BibtexParser {
        let inputStream = ANTLRInputStream(input)
        let lexer = BibtexLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        return try! BibtexParser(tokenStream)
    }
}
