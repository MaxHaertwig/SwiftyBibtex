/// Conference proceedings.
public struct Proceedings: Publication {
    internal static let requiredFields = Set(["title", "year"])

    public var publicationType: PublicationType { .proceedings }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let title: String
    public let year: Int

    // Optional
    public let editor: String?
    public let volume: Int?
    public var number: Int? { volume }
    public let series: String?
    public let address: String?
    public let publisher: String?
    public let organization: String?
    public let month: Month?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, title: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
        self.title = title
        self.year = year
        
        self.editor = fields["editor"]
        self.volume = fields.intValue(forKey: "volume")
        self.series = fields["series"]
        self.address = fields["address"]
        self.publisher = fields["publisher"]
        self.organization = fields["organization"]
        self.month = fields.month
        self.note = fields["note"]
    }
}
