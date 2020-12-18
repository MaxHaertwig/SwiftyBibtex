/// An error occurring when the parser encounters a token that it can't recognize.
public struct TokenRecognitionParserError: ParserError, Equatable {
    public var positionInFile: PositionInFile

    /// The offending symbol.
    public let offendingSymbol: String

    public var message: String {
        return "Token recognition error at '\(offendingSymbol)'"
    }
}
