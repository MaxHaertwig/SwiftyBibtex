/// An article from a journal or magazine.
public struct Article: Publication {
    internal static let requiredFields = Set(["author", "title", "journal", "year"])

    public var publicationType: PublicationType { .article }
    public let citationKey: String
    public let fields: [String : String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let author: String
    public let title: String
    public let journal: String
    public let year: Int

    // Optional
    public let volume: Int?
    public let number: Int?
    public let pages: String?
    public let month: Month?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, author: String, title: String, journal: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile

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
