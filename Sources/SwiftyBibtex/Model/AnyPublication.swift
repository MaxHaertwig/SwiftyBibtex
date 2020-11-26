internal struct AnyPublication: Publication {
    public let publicationType: PublicationType
    public let citationKey: String
    public let fields: [String: String]
    
    init(publicationType: PublicationType, citationKey: String, fields: [String: String]) {
        self.publicationType = publicationType
        self.citationKey = citationKey
        self.fields = fields
    }
}
