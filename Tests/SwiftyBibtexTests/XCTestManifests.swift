import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BibtexStringListenerTests.allTests),
        testCase(BibtexPublicationListenerTests.allTests),
        testCase(SwiftyBibtexTests.allTests)
    ]
}
#endif
