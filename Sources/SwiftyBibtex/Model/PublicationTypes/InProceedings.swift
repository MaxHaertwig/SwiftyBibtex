/// An article in a conference proceedings.
public struct InProceedings: Publication {
    internal static let requiredFields = Set(["author", "title", "booktitle", "year"])

    public var publicationType: PublicationType { .inProceedings }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let author: String
    public let title: String
    public let bookTitle: String
    public let year: Int

    // Optional
    public let editor: String?
    public let volume: Int?
    public var number: Int? { volume }
    public let series: String?
    public let pages: String?
    public let address: String?
    public let month: Month?
    public let organization: String?
    public let publisher: String?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, author: String, title: String, bookTitle: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
        self.author = author
        self.title = title
        self.bookTitle = bookTitle
        self.year = year
        
        self.editor = fields["editor"]
        self.volume = fields.intValue(forKey: "volume")
        self.series = fields["series"]
        self.pages = fields["pages"]
        self.address = fields["address"]
        self.month = fields.month
        self.organization = fields["organization"]
        self.publisher = fields["publisher"]
        self.note = fields["note"]
    }
}
