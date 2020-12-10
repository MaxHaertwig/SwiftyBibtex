import BibtexParser

internal final class BibtexListener : BibtexParserBaseListener {
    private(set) var publications = [ParsedPublication]()
    private(set) var comments = [String]()

    private var stringDefinitions: [String: String]
    private var fields = [String: String]()
    
    init(stringDefinitions: [String: String] = [:]) {
        self.stringDefinitions = stringDefinitions
    }

    override func enterFields(_ ctx: BibtexParser.FieldsContext) {
        fields = [:]
    }

    override func enterField(_ ctx: BibtexParser.FieldContext) {
        if let fieldName = ctx.fieldName.getText() {
            if let fieldValue = ctx.curlyValue()?.getText() {
                fields[fieldName] = fieldValue
            } else {
                fields[fieldName] = ctx.fieldString().map { $0.getText() }.reduce("") { (prefix: String, string: String) in
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
            publications.append(ParsedPublication(type: publicationType, citationKey: citationKey, fields: fields))
        }
    }

    override func exitComment(_ ctx: BibtexParser.CommentContext) {
        if let comment = ctx.curlyValue()?.getText() ?? ctx.parenValue()?.getText(), !comment.isEmpty {
            comments.append(comment)
        }
    }
}