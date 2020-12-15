/// A part of a book having its own title.
public struct InCollection: Publication {
    internal static let requiredFields = Set(["author", "title", "booktitle", "publisher", "year"])

    public var publicationType: PublicationType { .inCollection }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let author: String
    let title: String
    let bookTitle: String
    let publisher: String
    let year: Int

    // Optional
    let editor: String?
    let volume: Int?
    var number: Int? { volume }
    let series: String?
    let type: String?
    let chapter: Int?
    let pages: String?
    let address: String?
    let edition: String?
    let month: Month?
    let note: String?
    
    init(citationKey: String, fields: [String: String], author: String, title: String, bookTitle: String, publisher: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
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
