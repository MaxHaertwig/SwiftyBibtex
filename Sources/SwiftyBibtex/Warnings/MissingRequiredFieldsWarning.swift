/// Indicates that a publication is missing required fields of its type.
public struct MissingRequiredFieldsWarning: ParserWarning, Equatable {
    /// The publication's citation key.
    public let citationKey: String

    /// The publication's indicated type.
    public let publicationType: PublicationType

    /// The publication's missing fields.
    public let missingFields: [String]

    public var message: String {
        let prefix = "The publication \"\(citationKey)\" of type \(publicationType) is missing the required field"
        if missingFields.count == 1 {
            return prefix + " \(missingFields[0])."
        }
        if missingFields.count == 2 {
            return prefix + "s \(missingFields[0]) and \(missingFields[1])."
        }
        return prefix + "s \(missingFields.dropLast().joined(separator: ", ")), and \(missingFields.last!)."
    }

    static public func == (lhs: MissingRequiredFieldsWarning, rhs: MissingRequiredFieldsWarning) -> Bool {
        return lhs.citationKey == rhs.citationKey && lhs.publicationType == rhs.publicationType && Set(lhs.missingFields) == Set(rhs.missingFields)
    }
}
