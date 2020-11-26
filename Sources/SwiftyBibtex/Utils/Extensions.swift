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
