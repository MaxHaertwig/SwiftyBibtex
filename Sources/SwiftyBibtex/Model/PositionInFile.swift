/// A position in a file.
public struct PositionInFile: CustomStringConvertible, Comparable, Codable {
    /// A line number in a file.
    public let line: Int

    /// A character position in a line.
    public let positionInLine: Int

    internal init(_ line: Int, _ positionInLine: Int) {
        self.line = line
        self.positionInLine = positionInLine
    }

    public var description: String {
        return "(\(line):\(positionInLine))"
    }

    public static func == (lhs: PositionInFile, rhs: PositionInFile) -> Bool {
        return lhs.line == rhs.line && lhs.positionInLine == rhs.positionInLine
    }

    public static func < (lhs: PositionInFile, rhs: PositionInFile) -> Bool {
        return lhs.line != rhs.line ? lhs.line < rhs.line : lhs.positionInLine < rhs.positionInLine
    }
}
