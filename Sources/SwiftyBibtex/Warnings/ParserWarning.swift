/// A warning the parser generated.
public protocol ParserWarning: CustomStringConvertible {
    // The warning's message.
    var message: String { get }
}

public extension ParserWarning {
    var description: String {
        return "Warning: \(message)"
    }
}
