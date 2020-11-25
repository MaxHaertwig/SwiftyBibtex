import BibtexParser

internal final class BibtexStringListener : BibtexParserBaseListener {
    private(set) var definitions = [String: String]()
    
    override func exitString(_ ctx: BibtexParser.StringContext) {
        if let name = ctx.stringName.getText(), let value = ctx.STRING_LITERAL()?.getText() {
            definitions[name] = String(value.dropFirst().dropLast())
        }
    }
}
