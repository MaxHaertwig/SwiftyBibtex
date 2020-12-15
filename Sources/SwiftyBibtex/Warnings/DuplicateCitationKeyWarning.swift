/// Indicates that a citation key has been encountered more than once.
public struct DuplicateCitationKeyWarning: ParserWarning, Equatable {
    /// The citation key that was encountered more than once.
    public let citationKey: String

    /// The occurrences of the duplicate citation key as (line, charPositionInLine) tuples.
    public let occurrences: [(line: Int, charPositionInLine: Int)]

    init?(citationKey: String, occurrences: [(Int, Int)]) {
        if occurrences.count < 2 {
            return nil
        }
        self.citationKey = citationKey
        self.occurrences = occurrences
    }

    public var message: String {
        let prefix = "Duplicate citation key \"\(citationKey)\" found on"
        if occurrences.count == 2 {
            return prefix + " (\(occurrences[0].line):\(occurrences[0].charPositionInLine)) and (\(occurrences[1].line):\(occurrences[1].charPositionInLine))."
        }
        return prefix + " \(occurrences.dropLast().map { "(\($0.line):\($0.charPositionInLine))" }.joined(separator: ", ")), and (\(occurrences.last!.line):\(occurrences.last!.charPositionInLine))."
    }

    public static func == (lhs: DuplicateCitationKeyWarning, rhs: DuplicateCitationKeyWarning) -> Bool {
        return lhs.citationKey == rhs.citationKey && lhs.occurrences.map { "\($0.line)#\($0.charPositionInLine)" } == lhs.occurrences.map { "\($0.line)#\($0.charPositionInLine)" }
    }
}
