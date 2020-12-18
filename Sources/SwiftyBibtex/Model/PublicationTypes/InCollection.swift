/// A part of a book having its own title.
public struct InCollection: Publication {
    internal static let requiredFields = Set(["author", "title", "booktitle", "publisher", "year"])

    public var publicationType: PublicationType { .inCollection }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let author: String
    public let title: String
    public let bookTitle: String
    public let publisher: String
    public let year: Int

    // Optional
    public let editor: String?
    public let volume: Int?
    public var number: Int? { volume }
    public let series: String?
    public let type: String?
    public let chapter: Int?
    public let pages: String?
    public let address: String?
    public let edition: String?
    public let month: Month?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, author: String, title: String, bookTitle: String, publisher: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
        self.author = author
        self.title = title
        self.bookTitle = bookTitle
        self.publisher = publisher
        self.year = year
        
        self.editor = fields["editor"]
        self.volume = fields.intValue(forKey: "volume")
        self.series = fields["series"]
        self.type = fields["type"]
        self.chapter = fields.intValue(forKey: "chapter")
        self.pages = fields["pages"]
        self.address = fields["address"]
        self.edition = fields["edition"]
        self.month = fields.month
        self.note = fields["note"]
    }
}
