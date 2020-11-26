/// An article in a conference proceedings.
public struct InProceedings: Publication {
    public var publicationType: PublicationType { .inProceedings }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let author: String
    let title: String
    let bookTitle: String
    let year: Int

    // Optional
    let editor: String?
    let volume: Int?
    var number: Int? { volume }
    let series: String?
    let pages: String?
    let address: String?
    let month: Month?
    let organization: String?
    let publisher: String?
    let note: String?
    
    init(citationKey: String, fields: [String: String], author: String, title: String, bookTitle: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
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
