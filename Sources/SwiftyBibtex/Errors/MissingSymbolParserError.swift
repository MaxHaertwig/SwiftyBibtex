/// An error occurring when the parser encounters a missing symbol.
public struct MissingSymbolParserError: ParserError, Equatable {
    public var positionInFile: PositionInFile

    /// The missing symbol.
    public let missingSymbol: String

    /// The location at which the parser expected the missing symbol.
    public let location: String

    public var message: String {
        return "Missing \(missingSymbol) at '\(location)'"
    }
}
