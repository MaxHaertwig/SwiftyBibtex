import BibtexParser

internal final class BibtexStringListener : BibtexParserBaseListener {
    private(set) var definitions = [String: (replacement: String, line: Int, charPositionInLine: Int)]()

    override func exitString(_ ctx: BibtexParser.StringContext) {
        if let name = ctx.stringName.getText(), let value = ctx.STRING_LITERAL()?.getText() {
            definitions[name] = (String(value.dropFirst().dropLast()), ctx.start?.getLine() ?? 0, ctx.getStart()?.getCharPositionInLine() ?? 0)
        }
    }
}
