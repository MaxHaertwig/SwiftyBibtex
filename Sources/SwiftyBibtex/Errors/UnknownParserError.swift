internal struct UnknownParserError: ParserError, Equatable {
    let line: Int
    let charPositionInLine: Int
    let message: String
}
