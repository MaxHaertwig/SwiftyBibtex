import Antlr4
import BibtexParser

struct SwiftyBibtex {
    static func parse(_ input: String) throws -> [Publication] {
        let stringListener = BibtexStringListener()
        let bibtexParser1 = parser(for: input)
        try ParseTreeWalker().walk(stringListener, try bibtexParser1.root())
        
        let publicationListener = BibtexPublicationListener(stringDefinitions: stringListener.definitions)
        let bibtexParser2 = parser(for: input)
        try ParseTreeWalker().walk(publicationListener, try bibtexParser2.root())
        return publicationListener.publications
    }
    
    internal static func parser(for input: String) -> BibtexParser {
        let inputStream = ANTLRInputStream(input)
        let lexer = BibtexLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        return try! BibtexParser(tokenStream)
    }
}
