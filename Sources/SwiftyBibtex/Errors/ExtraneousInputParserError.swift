/// An error occurring when extraneous input is encountered.
public struct ExtraneousInputParserError: ParserError, Equatable {
    public let line: Int
    public let charPositionInLine: Int

    /// The offending symbol.
    public let offendingSymbol: String

    /// The symbols the parser expected to encounter in place of the offending symbol.
    public let expectedSymbols: [String]

    public var message: String {
        let expectedSymbolsString = expectedSymbols.count == 1 ? expectedSymbols[0] : "{" + expectedSymbols.joined(separator: ", ") + "}"
        return "Extraneous input '\(offendingSymbol)' expecting \(expectedSymbolsString)"
    }
}
