/// Indicates that a non-standard publication type has been encountered.
public struct UnrecognizedPublicationTypeWarning: ParserWarning, Equatable {
    /// The publication's citation key.
    public let citationKey: String

    /// The publication's indicated type.
    public let publicationType: String

    /// The line on which the publication was defined.
    public let line: Int

    /// The publication's position on its line.
    public let charPositionInLine: Int

    public var message: String {
        return "The publication \"\(citationKey)\" has an unrecognized type: \(publicationType)."
    }
}
