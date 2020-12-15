import BibtexParser

internal final class BibtexListener : BibtexParserBaseListener {
    private(set) var publications = [ParsedPublication]()
    private(set) var preambles = [String]()
    private(set) var comments = [String]()
    private(set) var warnings = [ParserWarning]()
    private(set) var errors = [ParserError]()

    private var stringDefinitions: [String: (replacement: String, line: Int, charPositionInLine: Int, used: Bool)]
    private var loggingLevel: SwiftyBibtex.LoggingLevel
    private var citationKeys = [String: [(Int, Int)]]()
    
    init(stringDefinitions: [String: (replacement: String, line: Int, charPositionInLine: Int)] = [:], loggingLevel: SwiftyBibtex.LoggingLevel = .none) {
        self.stringDefinitions = stringDefinitions.mapValues { ($0.replacement, $0.line, $0.charPositionInLine, false) }
        self.loggingLevel = loggingLevel
    }

    private static let intFields = Set(["chapter", "edition", "number", "series", "volume", "year"])
    private var fields = [String: String]()

    override func enterFields(_ ctx: BibtexParser.FieldsContext) {
        fields = [:]
    }

    override func exitField(_ ctx: BibtexParser.FieldContext) {
        if let fieldName = ctx.fieldName?.getText()?.lowercased(), let fieldValue = ctx.curlyValue()?.getText() ?? assembleConcatString(ctx.concatString()) {
            let value = fieldValue
                .replacingOccurrences(of: "\r\n", with: "\n")
                .split(separator: "\n")
                .enumerated()
                .map { i, line in
                    return i == 0 ? String(line) : line.replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
                }
                .joined(separator: " ")
            fields[fieldName] = value

            if Self.intFields.contains(fieldName) && Int(value) == nil {
                let contextStart = ctx.curlyValue()?.getStart() ?? ctx.concatString()?.getStart()
                let warning = MismatchedDataTypeWarning(fieldName: fieldName, line: contextStart?.getLine() ?? 0, charPositionInLine: contextStart?.getCharPositionInLine() ?? 0, actualDataType: String(describing: String.self), expectedDataType: String(describing: Int.self))
                warnings.append(warning)
                if loggingLevel == .warn {
                    print(warning)
                }
            }
        }
    }
    
    override func exitPublication(_ ctx: BibtexParser.PublicationContext) {
        // TODO Check for missing fields here
        if let publicationTypeString = ctx.publicationType.getText(), let citationKey = ctx.citationKey.getText() {
            let occurrence = (ctx.citationKey.getLine(), ctx.citationKey.getCharPositionInLine())
            if citationKeys[citationKey] == nil {
                citationKeys[citationKey] = [occurrence]
            } else {
                citationKeys[citationKey]!.append(occurrence)
            }

            publications.append(ParsedPublication(type: publicationTypeString, citationKey: citationKey, fields: fields))

            let publicationType = PublicationType(publicationTypeString)
            let missingFields = publicationType.requiredFields.filter { fields[$0] == nil }
            if !missingFields.isEmpty {
                let warning = MissingRequiredFieldsWarning(citationKey: citationKey, publicationType: publicationType, missingFields: Array(missingFields))
                warnings.append(warning)
                if loggingLevel == .warn {
                    print(warning)
                }
            }

            if case .other(let unrecognizedType) = publicationType {
                let warning = UnrecognizedPublicationTypeWarning(citationKey: citationKey, publicationType: unrecognizedType, line: ctx.getStart()?.getLine() ?? 0, charPositionInLine: ctx.getStart()?.getCharPositionInLine() ?? 0)
                warnings.append(warning)
                if loggingLevel == .warn {
                    print(warning)
                }
            }
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

    override func exitBibFile(_ ctx: BibtexParser.BibFileContext) {
        warnings.append(contentsOf: citationKeys.filter { $0.value.count >= 2 }.map { DuplicateCitationKeyWarning(citationKey: $0.key, occurrences: $0.value)! })
        warnings.append(contentsOf: stringDefinitions.filter { !$0.value.used }.map { UnusedStringDefinitionWarning(name: $0.key, line: $0.value.line, charPositionInLine: $0.value.charPositionInLine) })
        if loggingLevel == .warn {
            warnings.forEach { print($0) }
        }
    }

    private func assembleConcatString(_ ctx: BibtexParser.ConcatStringContext?) -> String? {
        return ctx?.fieldString().reduce("") { (prefix: String, context: BibtexParser.FieldStringContext) in
            let string = context.getText()
            if string.hasPrefix("\"") {
                return prefix + string.dropFirst().dropLast()
            } else if let tuple = stringDefinitions[string] {
                stringDefinitions[string]!.used = true
                return prefix + tuple.replacement
            }

            let error = StringDefinitionNotFoundParserError(line: context.getStart()?.getLine() ?? 1, charPositionInLine: context.getStart()?.getCharPositionInLine() ?? 0, string: string)
            errors.append(error)
            if loggingLevel != .none {
                print(error)
            }
            return prefix + string
        }
    }
}
