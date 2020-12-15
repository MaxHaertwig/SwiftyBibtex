/// A report published by a school or other institution, usually numbered within a series.
public struct TechReport: Publication {
    internal static let requiredFields = Set(["author", "title", "institution", "year"])

    public var publicationType: PublicationType { .techReport }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let author: String
    let title: String
    let institution: String
    let year: Int

    // Optional
    let type: String?
    let number: Int?
    let address: String?
    let month: Month?
    let note: String?
    
    init(citationKey: String, fields: [String: String], author: String, title: String, institution: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.author = author
        self.title = title
        self.institution = institution
        self.year = year
        
        self.type = fields["type"]
        self.number = fields.intValue(forKey: "number")
        self.address = fields["address"]
        self.month = fields.month
        self.note = fields["note"]
    }
}
