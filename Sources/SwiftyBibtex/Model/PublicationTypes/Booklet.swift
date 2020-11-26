/// A work that is printed and bound, but without a named publisher or sponsoring institution.
public struct Booklet: Publication {
    public var publicationType: PublicationType { .booklet }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let title: String

    // Optional
    let author: String?
    let howPublished: String?
    let address: String?
    let month: Month?
    let year: Int?
    let note: String?
    
    init(citationKey: String, fields: [String: String], title: String) {
        self.citationKey = citationKey
        self.fields = fields
        self.title = title
        
        self.author = fields["author"]
        self.howPublished = fields["howpublished"]
        self.address = fields["address"]
        self.month = fields.month
        self.year = fields.year
        self.note = fields["note"]
    }
}
