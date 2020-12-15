/// A book with an explicit publisher.
public struct Book: Publication {
    internal static let requiredFields = Set(["author", "editor", "title", "publisher", "year"])

    public var publicationType: PublicationType { .book }
    public let citationKey: String
    public let fields: [String : String]
    
    // Required
    public let author: String
    public var editor: String { author }
    public let title: String
    public let publisher: String
    public let year: Int

    // Optional
    public let volume: Int?
    public var number: Int? { volume }
    public let series: Int?
    public let address: String?
    public let edition: Int?
    public let month: Month?
    public let note: String?
    
    internal init(citationKey: String, fields: [String: String], author: String, title: String, publisher: String, year: Int) {
        self.citationKey = citationKey
        self.fields = fields
        self.author = author
        self.title = title
        self.publisher = publisher
        self.year = year
        
        self.volume = fields.intValue(forKey: "volume")
        self.series = fields.intValue(forKey: "series")
        self.address = fields["address"]
        self.edition = fields.intValue(forKey: "edition")
        self.month = fields.month
        self.note = fields["note"]
    }
}
