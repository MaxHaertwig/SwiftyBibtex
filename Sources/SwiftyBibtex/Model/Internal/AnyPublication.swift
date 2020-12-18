internal struct AnyPublication: Publication {
    public let publicationType: PublicationType
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
}
