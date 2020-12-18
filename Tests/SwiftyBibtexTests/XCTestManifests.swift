import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftyBibtexTests.allTests),
        // Errors
        testCase(ExtraneousInputParserErrorTests.allTests),
        testCase(MismatchedInputParserErrorTests.allTests),
        testCase(MissingSymbolParserErrorTests.allTests),
        testCase(NoViableAlternativeParserErrorTests.allTests),
        testCase(ParserErrorTests.allTests),
        testCase(TokenRecognitionParserErrorTests.allTests),
        // Listeners
        testCase(BibtexErrorListenerTests.allTests),
        testCase(BibtexListenerTests.allTests),
        testCase(BibtexStringListenerTests.allTests),
        // Model
        testCase(MonthTests.allTests),
        testCase(PositionInFileTests.allTests),
        testCase(PublicationTypesTests.allTests),
        testCase(RangeInFileTests.allTests),
        // Utils
        testCase(ExtensionsTests.allTests),
        // Warnings
        testCase(DuplicateCitationKeyWarningTests.allTests),
        testCase(MismatchedDataTypeWarningTests.allTests),
        testCase(MissingRequiredFieldsWarningTests.allTests),
        testCase(UnrecognizedPublicationTypeWarningTests.allTests),
        testCase(UnusedStringDefinitionWarningTests.allTests)
    ]
}
#endif
