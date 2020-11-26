/// A document having an author and title, but not formally published.
public struct Unpublished: Publication {
    public var publicationType: PublicationType { .unpublished }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let author: String
    let title: String
    let note: String

    // Optional
    let month: Month?
    let year: Int?
    
    init(citationKey: String, fields: [String: String], author: String, title: String, note: String) {
        self.citationKey = citationKey
        self.fields = fields
        self.author = author
        self.title = title
        self.note = note
        
        self.month = fields.month
        self.year = fields.year
    }
}
