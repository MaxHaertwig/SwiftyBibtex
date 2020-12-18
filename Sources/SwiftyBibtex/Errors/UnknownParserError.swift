internal struct UnknownParserError: ParserError, Equatable {
    let positionInFile: PositionInFile
    let message: String
}
