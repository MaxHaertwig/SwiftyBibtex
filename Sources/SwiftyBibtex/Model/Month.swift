public enum Month: Int, CustomStringConvertible, CaseIterable {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december

    /// Initializes the month with its name or its 3-letter abbreviation. Returns nil if the given string is invalid.
    public init?(_ string: String) {
        let lowercasedString = string.lowercased()
        if lowercasedString == "jan" || lowercasedString == "january" { self = .january }
        else if lowercasedString == "feb" || lowercasedString == "february" { self = .february }
        else if lowercasedString == "mar" || lowercasedString == "march" { self = .march }
        else if lowercasedString == "apr" || lowercasedString == "april" { self = .april }
        else if lowercasedString == "may" || lowercasedString == "may" { self = .may }
        else if lowercasedString == "jun" || lowercasedString == "june" { self = .june }
        else if lowercasedString == "jul" || lowercasedString == "july" { self = .july }
        else if lowercasedString == "aug" || lowercasedString == "august" { self = .august }
        else if lowercasedString == "sep" || lowercasedString == "september" { self = .september }
        else if lowercasedString == "oct" || lowercasedString == "october" { self = .october }
        else if lowercasedString == "nov" || lowercasedString == "november" { self = .november }
        else if lowercasedString == "dec" || lowercasedString == "december" { self = .december }
        else { return nil }
    }

    public var description: String {
        return ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"][rawValue - 1]
    }
}
