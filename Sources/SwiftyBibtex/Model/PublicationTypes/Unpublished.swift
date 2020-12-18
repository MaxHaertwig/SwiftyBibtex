/// A document having an author and title, but not formally published.
public struct Unpublished: Publication {
    internal static let requiredFields = Set(["author", "title", "note"])

    public var publicationType: PublicationType { .unpublished }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let author: String
    public let title: String
    public let note: String

    // Optional
    public let month: Month?
    public let year: Int?
    
    init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, author: String, title: String, note: String) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
        self.author = author
        self.title = title
        self.note = note
        
        self.month = fields.month
        self.year = fields.year
    }
}
