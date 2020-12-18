/// A master's thesis.
public struct MasterThesis: Publication {
    internal static let requiredFields = Set(["author", "title", "school", "year"])

    public var publicationType: PublicationType { .masterThesis }
    public let citationKey: String
    public let fields: [String: String]
    public let rangeInFile: RangeInFile
    
    // Required
    public let author: String
    public let title: String
    public let school: String
    public let year: Int

    // Optional
    public let type: String?
    public let address: String?
    public let month: Month?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], rangeInFile: RangeInFile, author: String, title: String, school: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.rangeInFile = rangeInFile
        
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
