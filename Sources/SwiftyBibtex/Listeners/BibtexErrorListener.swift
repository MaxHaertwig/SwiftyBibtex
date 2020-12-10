import Antlr4

internal final class BibtexErrorListener: BaseErrorListener {
    private(set) var errors = [BibtexParserError]()

    override func syntaxError<T>(_ recognizer: Recognizer<T>, _ offendingSymbol: AnyObject?, _ line: Int, _ charPositionInLine: Int, _ msg: String, _ e: AnyObject?) where T : ATNSimulator {
        errors.append(BibtexParserError(line: line, charPositionInLine: charPositionInLine, message: msg))
    }
}
