/// An error that occurred during the parsing process.
public protocol ParserError: CustomStringConvertible {
    /// The line of the input on which the error occurred.
    var line: Int { get }

    /// The error's position in line.
    var charPositionInLine: Int { get }

    /// The error message.
    var message: String { get }
}

public extension ParserError {
    var description: String {
        return "line \(line):\(charPositionInLine) \(message)"
    }
}
