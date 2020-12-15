/// A part of a book, e.g., a chpater, section, or whatever and/or a range of pages.
public struct InBook: Publication {
    internal static let requiredFields = Set(["author", "editor", "title", "chapter", "pages", "publisher", "year"])

    public var publicationType: PublicationType { .inBook }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let author: String
    var editor: String { author }
    let title: String
    let chapter: Int
    let pages: String
    let publisher: String
    let year: Int

    // Optional
    let volume: Int?
    var number: Int? {volume}
    let series: String?
    let type: String?
    let address: String?
    let edition: String?
    let month: Month?
    let note: String?
    
    init(citationKey: String, fields: [String: String], author: String, title: String, chapter: Int, pages: String, publisher: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
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
