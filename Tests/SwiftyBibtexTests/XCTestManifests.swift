import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftyBibtexTests.allTests),
        // Listeners
        testCase(BibtexCommentListenerTests.allTests),
        testCase(BibtexStringListenerTests.allTests),
        testCase(BibtexPublicationListenerTests.allTests),
        // Model
        testCase(MonthTests.allTests),
        testCase(PublicationTypesTests.allTests),
        // Utils
        testCase(ExtensionsTests.allTests)
    ]
}
#endif
