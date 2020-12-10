/// An error that occurred during the parsing process.
public struct BibtexParserError {
    /// The line of the input on which the error occurred.
    let line: Int

    /// The error's position in line.
    let charPositionInLine: Int

    /// The error message.
    let message: String
}
