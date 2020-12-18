/// Technical documentation.
public struct Manual: Publication {
    internal static let requiredFields = Set(["title"])

    public var publicationType: PublicationType { .manual }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let title: String

    // Optional
    public let author: String?
    public let organization: String?
    public let address: String?
    public let edition: String?
    public let month: Month?
    public let year: Int?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, title: String) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile

        self.title = title
        
        self.author = fields["author"]
        self.organization = fields["organization"]
        self.address = fields["address"]
        self.edition = fields["edition"]
        self.month = fields.month
        self.year = fields.year
        self.note = fields["note"]
    }
}
