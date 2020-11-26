/// Use this type when nothing else fits.
public struct Misc: Publication {
    public var publicationType: PublicationType { .misc }
    public let citationKey: String
    public let fields: [String: String]
    
    // Optional
    let author: String?
    let title: String?
    let howPublished: String?
    let month: Month?
    let year: Int?
    let note: String?
    
    init(citationKey: String, fields: [String: String]) {
        self.citationKey = citationKey
        self.fields = fields
        
        self.author = fields["author"]
        self.title = fields["title"]
        self.howPublished = fields["howpublished"]
        self.month = fields.month
        self.year = fields.year
        self.note = fields["note"]
    }
}
