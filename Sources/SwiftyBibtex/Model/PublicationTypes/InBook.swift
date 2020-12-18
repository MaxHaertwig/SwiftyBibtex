/// A part of a book, e.g., a chpater, section, or whatever and/or a range of pages.
public struct InBook: Publication {
    internal static let requiredFields = Set(["author", "editor", "title", "chapter", "pages", "publisher", "year"])

    public var publicationType: PublicationType { .inBook }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let author: String
    public var editor: String { author }
    public let title: String
    public let chapter: Int
    public let pages: String
    public let publisher: String
    public let year: Int

    // Optional
    public let volume: Int?
    public var number: Int? {volume}
    public let series: String?
    public let type: String?
    public let address: String?
    public let edition: String?
    public let month: Month?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, author: String, title: String, chapter: Int, pages: String, publisher: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
        self.author = author
        self.title = title
        self.chapter = chapter
        self.pages = pages
        self.publisher = publisher
        self.year = year
        
        self.volume = fields.intValue(forKey: "volume")
        self.series = fields["series"]
        self.type = fields["type"]
        self.address = fields["address"]
        self.edition = fields["edition"]
        self.month = fields.month
        self.note = fields["note"]
    }
}
