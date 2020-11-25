import BibtexParser

internal final class CustomBibtexListener : BibtexParserBaseListener {
    private(set) var publications = [Publication]()
    
    private var tags = [String: String]()

    override func enterTags(_ ctx: BibtexParser.TagsContext) {
        tags = [:]
    }

    override func enterTag(_ ctx: BibtexParser.TagContext) {
        if let tagName = ctx.tagName.getText() {
            if let tagValue = ctx.curlyTagValue()?.getText() {
                tags[tagName] = tagValue
            } else {
                tags[tagName] = ctx.STRING_LITERAL().map { $0.getText().dropFirst().dropLast() }.joined()
            }
        }
    }
    
    override func exitPublication(_ ctx: BibtexParser.PublicationContext) {
        if let publicationType = ctx.publicationType.getText(), let citationKey = ctx.citationKey.getText() {
            publications.append(Publication(type: publicationType, citationKey: citationKey, tags: tags))
        }
    }
}
