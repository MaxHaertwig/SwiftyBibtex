import Antlr4
import Foundation

internal final class BibtexErrorListener: BaseErrorListener {
    private static let mismatchedInputRegex = try! NSRegularExpression(pattern: "^mismatched input '(.+)' expecting (.+)$")
    private static let extraneousInputRegex = try! NSRegularExpression(pattern: "^extraneous input '(.+)' expecting (.+)$")
    private static let missingSymbolRegex = try! NSRegularExpression(pattern: "^missing (.+) at '(.+)'$")
    private static let noViableAlternativeRegex = try! NSRegularExpression(pattern: "^no viable alternative at input '(.+)'$")
    private static let tokenRecognitionErrorRegex = try! NSRegularExpression(pattern: "^token recognition error at: '(.+)'$")

    private static let tokenReplacements = [
        "AT": "'@'",
        "COMMA": "','",
        "EQUALS": "'='",
        "HASH": "'#'",
        "OPEN_CURLY": "'{'",
        "CLOSE_CURLY": "'}'",
        "OPEN_PAREN": "'('",
        "CLOSE_PAREN": "')'",
        "STRING": "'String'",
        "PREAMBLE": "'Preamble'",
        "NAME": "Name",
        "STRING_LITERAL": "String Literal",
        "CURLY_VALUE_OPEN_CURLY": "'{'",
        "CURLY_VALUE_CLOSE_CURLY": "'}'",
        "PAREN_VALUE_OPEN_PAREN": "'('",
        "PAREN_VALUE_CLOSE_PAREN": "')'"
    ]

    private static let tokensToRemove = Set(["COMMENT_START_CURLY", "COMMENT_START_PAREN"])

    private(set) var errors = [ParserError]()
    private var logErrors: Bool

    init(logErrors: Bool = false) {
        self.logErrors = logErrors
    }

    override func syntaxError<T>(_ recognizer: Recognizer<T>, _ offendingSymbol: AnyObject?, _ line: Int, _ charPositionInLine: Int, _ msg: String, _ e: AnyObject?) where T : ATNSimulator {
        let position = PositionInFile(line, charPositionInLine)
        var error: ParserError?
        if let match = Self.extraneousInputRegex.firstMatch(in: msg, options: []) {
            if let offendingSymbol = match.captureGroup(at: 1, in: msg), let expectedSymbolsString = match.captureGroup(at: 2, in: msg) {
                let expectedSymbols = (expectedSymbolsString.hasPrefix("{") ? expectedSymbolsString.dropFirst().dropLast().components(separatedBy: ", ") : [expectedSymbolsString]).filter { !Self.tokensToRemove.contains($0) }.map { Self.tokenReplacements[$0] ?? $0 }
                error = ExtraneousInputParserError(positionInFile: position, offendingSymbol: offendingSymbol, expectedSymbols: expectedSymbols)
            }
        } else if let match = Self.mismatchedInputRegex.firstMatch(in: msg, options: []) {
            if let offendingSymbol = match.captureGroup(at: 1, in: msg), let expectedSymbolsString = match.captureGroup(at: 2, in: msg) {
                let expectedSymbols = (expectedSymbolsString.hasPrefix("{") ? expectedSymbolsString.dropFirst().dropLast().components(separatedBy: ", ") : [expectedSymbolsString]).filter { !Self.tokensToRemove.contains($0) }.map { Self.tokenReplacements[$0] ?? $0 }
                error = MismatchedInputParserError(positionInFile: position, offendingSymbol: offendingSymbol, expectedSymbols: expectedSymbols)
            }
        } else if let match = Self.missingSymbolRegex.firstMatch(in: msg, options: []) {
            if let missingSymbol = match.captureGroup(at: 1, in: msg), let location = match.captureGroup(at: 2, in: msg) {
                error = MissingSymbolParserError(positionInFile: position, missingSymbol: Self.tokenReplacements[missingSymbol] ?? missingSymbol, location: location)
            }
        } else if let match = Self.noViableAlternativeRegex.firstMatch(in: msg, options: []) {
            if let offendingSymbol = match.captureGroup(at: 1, in: msg) {
                error = NoViableAlternativeParserError(positionInFile: position, offendingSymbol: offendingSymbol)
            }
        } else if let match = Self.tokenRecognitionErrorRegex.firstMatch(in: msg, options: []) {
            if let offendingSymbol = match.captureGroup(at: 1, in: msg) {
                error = TokenRecognitionParserError(positionInFile: position, offendingSymbol: offendingSymbol)
            }
        }
        if error == nil {
            error = UnknownParserError(positionInFile: position, message: msg)
        }
        if logErrors {
            print(error!)
        }
        errors.append(error!)
    }
}
