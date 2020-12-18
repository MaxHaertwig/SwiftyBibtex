/// Indicates that a string definition hasn't been used.
public struct UnusedStringDefinitionWarning: ParserWarning, Equatable {
    /// The string definition's name.
    public let name: String

    /// The string definition's position in the source file.
    public let positionInFile: PositionInFile

    public var message: String {
        return "Unused string definition \"\(name)\" on (\(positionInFile.line):\(positionInFile.positionInLine))."
    }
}
