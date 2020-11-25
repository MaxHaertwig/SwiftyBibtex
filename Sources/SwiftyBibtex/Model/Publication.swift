public struct Publication: Equatable {
    let type: String
    let citationKey: String
    let tags: [String: String]
    
    init(type: String, citationKey: String, tags: [String: String]) {
        self.type = type.lowercased()
        self.citationKey = citationKey
        self.tags = tags.reduce(into: [:]) { $0[$1.key.lowercased()] = $1.value }
    }
}
