import Antlr4
import BibtexParser

/// SwiftyBibtex's main interface.
public enum SwiftyBibtex {
    /// A tuple consisting of publications, preambles, comments, warnings, and errors.
    public typealias BibtexResult = (publications: [Publication], preambles: [String], comments: [String], warnings: [ParserWarning], errors: [ParserError])

    /// The parser's logging level.
    public enum LoggingLevel {
        /// Log warnings and errors.
        case warn

        /// Log only errors.
        case error

        /// Don't log anything.
        case none
    }

    /// Parses the given input and returns all recognized publications, preambles, comments, and encountered errors.
    public static func parse(_ input: String, loggingLevel: LoggingLevel = .warn) throws -> BibtexResult {
        let stringListener = BibtexStringListener()
        let bibtexParser1 = parser(for: input)
        try ParseTreeWalker().walk(stringListener, try bibtexParser1.root())

        let bibtexListener = BibtexListener(stringDefinitions: stringListener.definitions)
        let errorListener = BibtexErrorListener(logErrors: loggingLevel != .none)
        let bibtexParser2 = parser(for: input, errorListener: errorListener)
        try ParseTreeWalker().walk(bibtexListener, try bibtexParser2.root())
        return (processParsedPublications(bibtexListener.publications), bibtexListener.preambles, bibtexListener.comments, bibtexListener.warnings, errorListener.errors + bibtexListener.errors)
    }

    internal static func parser(for input: String, errorListener: ANTLRErrorListener? = nil) -> BibtexParser {
        let inputStream = ANTLRInputStream(input)
        let lexer = BibtexLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        let parser = try! BibtexParser(tokenStream)
        if let errorListener = errorListener {
            lexer.addErrorListener(errorListener)
            parser.addErrorListener(errorListener)
        }
        return parser
    }
    
    private static func processParsedPublications(_ parsedPublications: [ParsedPublication]) -> [Publication] {
        return parsedPublications.map { publication in
            let publicationType = PublicationType(publication.type)
            switch publicationType {
            case .article:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let journal = publication.fields["journal"],
                   let year = publication.fields.year {
                    return Article(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, journal: journal, year: year)
                }
            case .book:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let publisher = publication.fields["publisher"],
                   let year = publication.fields.year {
                    return Book(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, publisher: publisher, year: year)
                }
            case .booklet:
                if let title = publication.fields["title"] {
                    return Booklet(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, title: title)
                }
            case .inBook:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let chapter = publication.fields.intValue(forKey: "chapter"),
                   let pages = publication.fields["pages"],
                   let publisher = publication.fields["publisher"],
                   let year = publication.fields.year {
                    return InBook(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, chapter: chapter, pages: pages, publisher: publisher, year: year)
                }
            case .inCollection:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let bookTitle = publication.fields["booktitle"],
                   let publisher = publication.fields["publisher"],
                   let year = publication.fields.year {
                    return InCollection(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, bookTitle: bookTitle, publisher: publisher, year: year)
                }
            case .inProceedings:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let bookTitle = publication.fields["booktitle"],
                   let year = publication.fields.year {
                    return InProceedings(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, bookTitle: bookTitle, year: year)
                }
            case .manual:
                if let title = publication.fields["title"] {
                    return Manual(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, title: title)
                }
            case .masterThesis:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let school = publication.fields["school"],
                   let year = publication.fields.year {
                    return MasterThesis(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, school: school, year: year)
                }
            case .misc:
                return Misc(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile)
            case .phdThesis:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let school = publication.fields["school"],
                   let year = publication.fields.year {
                    return PhdThesis(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, school: school, year: year)
                }
            case .proceedings:
                if let title = publication.fields["title"],
                   let year = publication.fields.year {
                    return Proceedings(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, title: title, year: year)
                }
            case .techReport:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let institution = publication.fields["institution"],
                   let year = publication.fields.year {
                    return TechReport(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, institution: institution, year: year)
                }
            case .unpublished:
                if let author = publication.fields["author"],
                   let title = publication.fields["title"],
                   let note = publication.fields["note"] {
                    return Unpublished(citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile, author: author, title: title, note: note)
                }
            default:
                break
            }
            return AnyPublication(publicationType: publicationType, citationKey: publication.citationKey, fields: publication.fields, rangeInFile: publication.rangeInFile)
        }
    }
}
