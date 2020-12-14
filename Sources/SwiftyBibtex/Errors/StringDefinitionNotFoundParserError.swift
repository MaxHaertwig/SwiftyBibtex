/// An error occurring when a string couldn't be replaced by a string definition.
public struct StringDefinitionNotFoundParserError: ParserError, Equatable {
    public var line: Int
    public var charPositionInLine: Int

    /// The offending string.
    public var string: String

    public var message: String {
        return "Definition for string \"\(string)\" couldn't be found."
    }
}
