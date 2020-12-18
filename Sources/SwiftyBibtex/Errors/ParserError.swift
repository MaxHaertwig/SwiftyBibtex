/// An error that occurred during the parsing process.
public protocol ParserError: CustomStringConvertible {
    /// The error's position in the source file.
    var positionInFile: PositionInFile { get }

    /// The error message.
    var message: String { get }
}

public extension ParserError {
    var description: String {
        return "Error: line \(positionInFile.line):\(positionInFile.positionInLine) \(message)"
    }
}
