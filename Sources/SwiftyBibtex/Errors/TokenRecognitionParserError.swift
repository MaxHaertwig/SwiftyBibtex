/// An error occurring when the parser encounters a token that it can't recognize.
public struct TokenRecognitionParserError: ParserError, Equatable {
    public let line: Int
    public let charPositionInLine: Int

    /// The offending symbol.
    public let offendingSymbol: String

    public var message: String {
        return "Token recognition error at '\(offendingSymbol)'"
    }
}
