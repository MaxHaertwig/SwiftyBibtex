import BibtexParser

internal final class BibtexListener : BibtexParserBaseListener {
    private(set) var publications = [ParsedPublication]()
    private(set) var preambles = [String]()
    private(set) var comments = [String]()
    private(set) var errors = [ParserError]()

    private var stringDefinitions: [String: String]
    private var fields = [String: String]()
    
    init(stringDefinitions: [String: String] = [:]) {
        self.stringDefinitions = stringDefinitions
    }

    override func enterFields(_ ctx: BibtexParser.FieldsContext) {
        fields = [:]
    }

    override func exitField(_ ctx: BibtexParser.FieldContext) {
        if let fieldName = ctx.fieldName?.getText(), let fieldValue = ctx.curlyValue()?.getText() ?? assembleConcatString(ctx.concatString()) {
            fields[fieldName] = fieldValue
                .replacingOccurrences(of: "\r\n", with: "\n")
                .split(separator: "\n")
                .enumerated()
                .map { i, line in
                    return i == 0 ? String(line) : line.replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
                }
                .joined(separator: " ")
        }
    }
    
    override func exitPublication(_ ctx: BibtexParser.PublicationContext) {
        if let publicationType = ctx.publicationType.getText(), let citationKey = ctx.citationKey.getText() {
            publications.append(ParsedPublication(type: publicationType, citationKey: citationKey, fields: fields))
        }
    }

    override func exitPreamble(_ ctx: BibtexParser.PreambleContext) {
        if let preamble = assembleConcatString(ctx.concatString()) {
            preambles.append(preamble)
        }
    }

    override func exitComment(_ ctx: BibtexParser.CommentContext) {
        if let comment = ctx.curlyValue()?.getText() ?? ctx.parenValue()?.getText(), !comment.isEmpty {
            comments.append(comment)
        }
    }

    private func assembleConcatString(_ ctx: BibtexParser.ConcatStringContext?) -> String? {
        return ctx?.fieldString().reduce("") { (prefix: String, context: BibtexParser.FieldStringContext) in
            let string = context.getText()
            if string.hasPrefix("\"") {
                return prefix + string.dropFirst().dropLast()
            } else if let replacement = stringDefinitions[string] {
                return prefix + replacement
            }

            let error = StringDefinitionNotFoundParserError(line: context.getStart()?.getLine() ?? 1, charPositionInLine: context.getStart()?.getCharPositionInLine() ?? 0, string: string)
            errors.append(error)
            return prefix + string
        }
    }
}
