/// Indicates that a string definition hasn't been used.
public struct UnusedStringDefinitionWarning: ParserWarning, Equatable {
    /// The string definition's name.
    public let name: String

    /// The line on which the string was defined.
    public let line: Int

    /// The string definition's position on its line.
    public let charPositionInLine: Int

    public var message: String {
        return "Unused string definition \"\(name)\" on (\(line):\(charPositionInLine))."
    }
}
