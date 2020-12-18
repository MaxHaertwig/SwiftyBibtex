/// An error occurring when the parser can't find a viable alternative to continue parsing.
public struct NoViableAlternativeParserError: ParserError, Equatable {
    public var positionInFile: PositionInFile

    /// The offending symbol.
    public let offendingSymbol: String

    public var message: String {
        return "No viable alternative at input '\(offendingSymbol)'"
    }
}
