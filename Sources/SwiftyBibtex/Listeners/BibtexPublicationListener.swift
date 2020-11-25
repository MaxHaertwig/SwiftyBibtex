import BibtexParser

internal final class BibtexPublicationListener : BibtexParserBaseListener {
    private(set) var publications = [Publication]()
    
    private var stringDefinitions: [String: String]
    private var tags = [String: String]()
    
    init(stringDefinitions: [String: String] = [:]) {
        self.stringDefinitions = stringDefinitions
    }

    override func enterTags(_ ctx: BibtexParser.TagsContext) {
        tags = [:]
    }

    override func enterTag(_ ctx: BibtexParser.TagContext) {
        if let tagName = ctx.tagName.getText() {
            if let tagValue = ctx.curlyTagValue()?.getText() {
                tags[tagName] = tagValue
            } else {
                tags[tagName] = ctx.tagString().map { $0.getText() }.reduce("") { (prefix: String, string: String) in
                    if string.hasPrefix("\"") {
                        return prefix + string.dropFirst().dropLast()
                    } else if let replacement = stringDefinitions[string] {
                        return prefix + replacement
                    }
                    return prefix
                }
            }
        }
    }
    
    override func exitPublication(_ ctx: BibtexParser.PublicationContext) {
        if let publicationType = ctx.publicationType.getText(), let citationKey = ctx.citationKey.getText() {
            publications.append(Publication(type: publicationType, citationKey: citationKey, tags: tags))
        }
    }
}
