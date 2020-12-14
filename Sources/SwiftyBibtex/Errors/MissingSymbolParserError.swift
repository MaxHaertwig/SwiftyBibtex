/// An error occurring when the parser encounters a missing symbol.
public struct MissingSymbolParserError: ParserError, Equatable {
    public let line: Int
    public let charPositionInLine: Int

    /// The missing symbol.
    public let missingSymbol: String

    /// The location at which the parser expected the missing symbol.
    public let location: String

    public var message: String {
        return "Missing \(missingSymbol) at '\(location)'"
    }
}
