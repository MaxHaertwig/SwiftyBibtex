/// Technical documentation.
public struct Manual: Publication {
    internal static let requiredFields = Set(["title"])

    public var publicationType: PublicationType { .manual }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let title: String

    // Optional
    let author: String?
    let organization: String?
    let address: String?
    let edition: String?
    let month: Month?
    let year: Int?
    let note: String?
    
    init(citationKey: String, fields: [String: String], title: String) {
        self.citationKey = citationKey
        self.fields = fields
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
