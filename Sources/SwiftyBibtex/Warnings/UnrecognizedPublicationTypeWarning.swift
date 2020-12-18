/// Indicates that a non-standard publication type has been encountered.
public struct UnrecognizedPublicationTypeWarning: ParserWarning, Equatable {
    /// The publication's citation key.
    public let citationKey: String

    /// The publication's indicated type.
    public let publicationType: String

    /// The position at which the publication was defined.
    public let positionInFile: PositionInFile

    public var message: String {
        return "The publication \"\(citationKey)\" has an unrecognized type: \(publicationType)."
    }
}
