/// An error occurring when the parser can't find a viable alternative to continue parsing.
public struct NoViableAlternativeParserError: ParserError, Equatable {
    public let line: Int
    public let charPositionInLine: Int

    /// The offending symbol.
    public let offendingSymbol: String

    public var message: String {
        return "no viable alternative at input '\(offendingSymbol)'"
    }
}
