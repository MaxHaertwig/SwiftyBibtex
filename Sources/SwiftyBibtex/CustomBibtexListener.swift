import BibtexParser

internal final class CustomBibtexListener : BibtexBaseListener {
    private(set) var entries = [Entry]()
    
    private var entryType = ""
    private var citationKey = ""
    private var tags = [String: String]()
    
    override func enterEntry(_ ctx: BibtexParser.EntryContext) {
        entryType = ctx.entryType.getText()!
        citationKey = ctx.citationKey.getText()!
    }

    override func enterTags(_ ctx: BibtexParser.TagsContext) {
        tags = [:]
    }

    override func enterTag(_ ctx: BibtexParser.TagContext) {
        if let tagName = ctx.tagName.getText(), let tagValue = ctx.tagValue.getText() {
            tags[tagName] = String(tagValue.dropFirst().dropLast())
        }
    }

    override func exitEntry(_ ctx: BibtexParser.EntryContext) {
        entries.append(Entry(type: entryType, citationKey: citationKey, tags: tags))
    }
}
