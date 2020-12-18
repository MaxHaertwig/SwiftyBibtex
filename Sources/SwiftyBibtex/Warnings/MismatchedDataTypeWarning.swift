/// Indicates that a publication's field doesn't have the expected data type.
public struct MismatchedDataTypeWarning: ParserWarning, Equatable {
    /// The field's name.
    public let fieldName: String

    /// The position of the field's name.
    public let positionInFile: PositionInFile

    /// The field's actual data type.
    public let actualDataType: String

    /// The field's expected data type.
    public let expectedDataType: String

    public var message: String {
        return "Mismatched data type for field \"\(fieldName)\": \(actualDataType), expected \(expectedDataType)."
    }
}
