/// Indicates that a citation key has been encountered more than once.
public struct DuplicateCitationKeyWarning: ParserWarning, Equatable {
    /// The citation key that was encountered more than once.
    public let citationKey: String

    /// The occurrences of the duplicate citation key as (line, charPositionInLine) tuples.
    public let occurrences: [PositionInFile]

    init?(citationKey: String, occurrences: [PositionInFile]) {
        if occurrences.count < 2 {
            return nil
        }
        self.citationKey = citationKey
        self.occurrences = occurrences
    }

    public var message: String {
        let prefix = "Duplicate citation key \"\(citationKey)\" found on"
        if occurrences.count == 2 {
            return prefix + " (\(occurrences[0].line):\(occurrences[0].positionInLine)) and (\(occurrences[1].line):\(occurrences[1].positionInLine))."
        }
        return prefix + " \(occurrences.dropLast().map { "(\($0.line):\($0.positionInLine))" }.joined(separator: ", ")), and (\(occurrences.last!.line):\(occurrences.last!.positionInLine))."
    }

    public static func == (lhs: DuplicateCitationKeyWarning, rhs: DuplicateCitationKeyWarning) -> Bool {
        return lhs.citationKey == rhs.citationKey && lhs.occurrences.map { "\($0.line)#\($0.positionInLine)" } == lhs.occurrences.map { "\($0.line)#\($0.positionInLine)" }
    }
}
