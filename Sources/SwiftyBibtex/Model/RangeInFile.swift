/// An inclusive range in a file.
public struct RangeInFile: CustomStringConvertible, Equatable {
    /// The start of the range.
    public let start: PositionInFile

    /// The end of the range (inclusive).
    public let end: PositionInFile

    internal init(_ start: PositionInFile, _ end: PositionInFile) {
        self.start = start
        self.end = end
    }

    internal init(_ start: (Int, Int), _ end: (Int, Int)) {
        self.start = PositionInFile(start.0, start.1)
        self.end = PositionInFile(end.0, end.1)
    }

    public var description: String {
        return start.description + "..." + end.description
    }
}
