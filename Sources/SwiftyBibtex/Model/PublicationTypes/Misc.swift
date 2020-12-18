/// Use this type when nothing else fits.
public struct Misc: Publication {
    public var publicationType: PublicationType { .misc }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Optional
    public let author: String?
    public let title: String?
    public let howPublished: String?
    public let month: Month?
    public let year: Int?
    public let note: String?
    
    init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
        self.author = fields["author"]
        self.title = fields["title"]
        self.howPublished = fields["howpublished"]
        self.month = fields.month
        self.year = fields.year
        self.note = fields["note"]
    }
}
