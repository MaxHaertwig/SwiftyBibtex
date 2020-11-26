/// Conference proceedings.
public struct Proceedings: Publication {
    public var publicationType: PublicationType { .proceedings }
    public let citationKey: String
    public let fields: [String: String]
    
    // Required
    let title: String
    let year: Int

    // Optional
    let editor: String?
    let volume: Int?
    var number: Int? { volume }
    let series: String?
    let address: String?
    let publisher: String?
    let organization: String?
    let month: Month?
    let note: String?
    
    init(citationKey: String, fields: [String: String], title: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.title = title
        self.year = year
        
        self.editor = fields["editor"]
        self.volume = fields.intValue(forKey: "volume")
        self.series = fields["series"]
        self.address = fields["address"]
        self.publisher = fields["publisher"]
        self.organization = fields["organization"]
        self.month = fields.month
        self.note = fields["note"]
    }
}
