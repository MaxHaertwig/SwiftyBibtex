import Antlr4
import BibtexParser

struct SwiftyBibtex {
    static func parse(_ input: String) throws -> [Publication] {
        let inputStream = ANTLRInputStream(input)
        let lexer = BibtexLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        let parser = try BibtexParser(tokenStream)
        let expressionContext = try parser.root()
        
        let listener = CustomBibtexListener()
        try ParseTreeWalker().walk(listener, expressionContext)
        return listener.publications
    }
}
