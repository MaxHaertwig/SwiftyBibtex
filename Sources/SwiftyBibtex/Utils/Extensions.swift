import Foundation

internal extension Dictionary where Key == String, Value == String {
    var month: Month? {
        if let string = self["month"] {
            if let monthNumber = Int(string) {
                return Month(rawValue: monthNumber)
            }
            return Month(string)
        }
        return nil
    }
    
    var year: Int? { intValue(forKey: "year") }
    
    func intValue(forKey key: String) -> Int? {
        if let string = self[key], let int = Int(string) {
            return int
        }
        return nil
    }
}

internal extension NSRegularExpression {
    func firstMatch(in string: String, options: MatchingOptions) -> NSTextCheckingResult? {
        return firstMatch(in: string, options: options, range: NSRange(location: 0, length: string.utf16.count))
    }
}

internal extension NSTextCheckingResult {
    func captureGroup(at index: Int, in string: String) -> String? {
        let objCRange = range(at: index)
        if objCRange.location != NSNotFound, let swiftRange = Range(objCRange, in: string) {
            return String(string[swiftRange])
        }
        return nil
    }
}
