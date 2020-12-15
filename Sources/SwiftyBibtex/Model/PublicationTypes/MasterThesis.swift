/// A master's thesis.
public struct MasterThesis: Publication {
    internal static let requiredFields = Set(["author", "title", "school", "year"])

    public var publicationType: PublicationType { .masterThesis }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let author: String
    let title: String
    let school: String
    let year: Int

    // Optional
    let type: String?
    let address: String?
    let month: Month?
    let note: String?
    
    init(citationKey: String, fields: [String: String], author: String, title: String, school: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.author = author
        self.title = title
        self.school = school
        self.year = year
        
        self.type = fields["type"]
        self.address = fields["address"]
        self.month = fields.month
        self.note = fields["note"]
    }
}
