/// An error occurring when the input doesn't match what the parser expects.
public struct MismatchedInputParserError: ParserError, Equatable {
    public var positionInFile: PositionInFile

    /// The offending symbol.
    public let offendingSymbol: String

    /// The symbols the parser expected to encounter in place of the offending symbol.
    public let expectedSymbols: [String]

    public var message: String {
        let expectedSymbolsString = expectedSymbols.count == 1 ? expectedSymbols[0] : "{" + expectedSymbols.joined(separator: ", ") + "}"
        return "Mismatched input '\(offendingSymbol)' expecting \(expectedSymbolsString)"
    }
}
