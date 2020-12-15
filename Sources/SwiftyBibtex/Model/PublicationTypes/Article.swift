/// An article from a journal or magazine.
public struct Article: Publication {
    internal static let requiredFields = Set(["author", "title", "journal", "year"])

    public var publicationType: PublicationType { .article }
    public let citationKey: String
    public let fields: [String : String]
    
    // Required
    let author: String
    let title: String
    let journal: String
    let year: Int

    // Optional
    let volume: Int?
    let number: Int?
    let pages: String?
    let month: Month?
    let note: String?
    
    internal init(citationKey: String, fields: [String: String], author: String, title: String, journal: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.author = author
        self.title = title
        self.journal = journal
        self.year = year
        
        self.volume = fields.intValue(forKey: "volume")
        self.number = fields.intValue(forKey: "number")
        self.pages = fields["pages"]
        self.month = fields.month
        self.note = fields["note"]
    }
}
