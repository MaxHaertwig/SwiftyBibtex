internal struct ParsedPublication: Equatable {
    let type: String
    let citationKey: String
    let fields: [String: String]
    let rangeInFile: RangeInFile
    
    init(type: String, citationKey: String, fields: [String: String], rangeInFile: RangeInFile) {
        self.type = type.lowercased()
        self.citationKey = citationKey
        self.fields = fields.reduce(into: [:]) { $0[$1.key.lowercased()] = $1.value }
        self.rangeInFile = rangeInFile
    }
}
