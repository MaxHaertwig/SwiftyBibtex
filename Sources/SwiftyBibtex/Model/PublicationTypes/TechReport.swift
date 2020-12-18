/// A report published by a school or other institution, usually numbered within a series.
public struct TechReport: Publication {
    internal static let requiredFields = Set(["author", "title", "institution", "year"])

    public var publicationType: PublicationType { .techReport }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let author: String
    public let title: String
    public let institution: String
    public let year: Int

    // Optional
    public let type: String?
    public let number: Int?
    public let address: String?
    public let month: Month?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, author: String, title: String, institution: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
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
