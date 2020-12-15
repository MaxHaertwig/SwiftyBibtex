import XCTest
@testable import SwiftyBibtex

final class PublicationTypesTests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testArticle() {
        let article: Article = testPublicationType(.article, fields: [
            "author": "a", "title": "t", "journal": "j", "year": "2020",
            "volume": "1", "number": "2", "pages": "3", "month": "jan", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(article.volume, 1)
        XCTAssertEqual(article.number, 2)
        XCTAssertEqual(article.pages, "3")
        XCTAssertEqual(article.month, .january)
        XCTAssertEqual(article.note, "n")
    }
    
    func testBook() {
        let book: Book = testPublicationType(.book, fields: [
            "author": "a", "title": "t", "publisher": "p", "year": "2020",
            "volume": "1", "series": "2", "address": "a", "edition": "3", "month": "feb", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(book.volume, 1)
        XCTAssertEqual(book.series, 2)
        XCTAssertEqual(book.address, "a")
        XCTAssertEqual(book.edition, 3)
        XCTAssertEqual(book.month, .february)
        XCTAssertEqual(book.note, "n")
    }
    
    func testBooklet() {
        let booklet: Booklet = testPublicationType(.booklet, fields: [
            "title": "t",
            "author": "a", "howPublished": "h", "address": "a", "month": "mar", "year": "2020", "note": "n"
        ], requiredField: "title")
        XCTAssertEqual(booklet.author, "a")
        XCTAssertEqual(booklet.howPublished, "h")
        XCTAssertEqual(booklet.address, "a")
        XCTAssertEqual(booklet.month, .march)
        XCTAssertEqual(booklet.year, 2020)
        XCTAssertEqual(booklet.note, "n")
    }
    
    func testInBook() {
        let inBook: InBook = testPublicationType(.inBook, fields: [
            "author": "a", "title": "t", "chapter": "1", "pages": "2", "publisher": "p", "year": "2020",
            "volume": "3", "series": "s", "type": "t", "address": "a", "edition": "e", "month": "apr", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(inBook.volume, 3)
        XCTAssertEqual(inBook.series, "s")
        XCTAssertEqual(inBook.type, "t")
        XCTAssertEqual(inBook.address, "a")
        XCTAssertEqual(inBook.edition, "e")
        XCTAssertEqual(inBook.month, .april)
        XCTAssertEqual(inBook.note, "n")
    }
    
    func testInCollection() {
        let inCollection: InCollection = testPublicationType(.inCollection, fields: [
            "author": "a", "title": "t", "bookTitle": "b", "publisher": "p", "year": "2020",
            "editor": "e", "volume": "1", "series": "s", "type": "t", "chapter": "2", "pages": "3", "address": "a", "edition": "e", "month": "may", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(inCollection.editor, "e")
        XCTAssertEqual(inCollection.volume, 1)
        XCTAssertEqual(inCollection.series, "s")
        XCTAssertEqual(inCollection.type, "t")
        XCTAssertEqual(inCollection.chapter, 2)
        XCTAssertEqual(inCollection.pages, "3")
        XCTAssertEqual(inCollection.address, "a")
        XCTAssertEqual(inCollection.edition, "e")
        XCTAssertEqual(inCollection.month, .may)
        XCTAssertEqual(inCollection.note, "n")
    }
    
    func testInProceedings() {
        let inProceedings: InProceedings = testPublicationType(.inProceedings, fields: [
            "author": "a", "title": "t", "bookTitle": "b", "year": "2020",
            "editor": "e", "volume": "1", "series": "s", "pages": "2", "address": "a", "month": "jun", "organization": "o", "publisher": "p", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(inProceedings.editor, "e")
        XCTAssertEqual(inProceedings.volume, 1)
        XCTAssertEqual(inProceedings.series, "s")
        XCTAssertEqual(inProceedings.pages, "2")
        XCTAssertEqual(inProceedings.address, "a")
        XCTAssertEqual(inProceedings.month, .june)
        XCTAssertEqual(inProceedings.organization, "o")
        XCTAssertEqual(inProceedings.publisher, "p")
        XCTAssertEqual(inProceedings.note, "n")
    }
    
    func testManual() {
        let manual: Manual = testPublicationType(.manual, fields: [
            "title": "t",
            "author": "a", "organization": "o", "address": "a", "edition": "e", "month": "jul", "year": "2020", "note": "n"
        ], requiredField: "title")
        XCTAssertEqual(manual.author, "a")
        XCTAssertEqual(manual.organization, "o")
        XCTAssertEqual(manual.address, "a")
        XCTAssertEqual(manual.edition, "e")
        XCTAssertEqual(manual.month, .july)
        XCTAssertEqual(manual.year, 2020)
        XCTAssertEqual(manual.note, "n")
    }
    
    func testMasterThesis() {
        let masterThesis: MasterThesis = testPublicationType(.masterThesis, fields: [
            "author": "a", "title": "t", "school": "s", "year": "2020",
            "type": "t", "address": "a", "month": "aug", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(masterThesis.type, "t")
        XCTAssertEqual(masterThesis.address, "a")
        XCTAssertEqual(masterThesis.month, .august)
        XCTAssertEqual(masterThesis.note, "n")
    }
    
    func testMisc() {
        let misc: Misc = testPublicationType(.misc, fields: [
            "author": "a", "title": "t", "howpublished": "h", "month": "sep", "year": "2020", "note": "n"
        ], requiredField: nil)
        XCTAssertEqual(misc.author, "a")
        XCTAssertEqual(misc.title, "t")
        XCTAssertEqual(misc.howPublished, "h")
        XCTAssertEqual(misc.month, .september)
        XCTAssertEqual(misc.year, 2020)
        XCTAssertEqual(misc.note, "n")
    }
    
    func testPhdThesis() {
        let phdThesis: PhdThesis = testPublicationType(.phdThesis, fields: [
            "author": "a", "title": "t", "school": "s", "year": "2020",
            "type": "t", "address": "a", "month": "oct", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(phdThesis.type, "t")
        XCTAssertEqual(phdThesis.address, "a")
        XCTAssertEqual(phdThesis.month, .october)
        XCTAssertEqual(phdThesis.note, "n")
    }
    
    func testProceedings() {
        let proceedings: Proceedings = testPublicationType(.proceedings, fields: [
            "title": "t", "year": "2020",
            "editor": "e", "volume": "1", "series": "s", "address": "a", "publisher": "p", "organization": "o", "month": "nov", "note": "n"
        ], requiredField: "title")
        XCTAssertEqual(proceedings.editor, "e")
        XCTAssertEqual(proceedings.volume, 1)
        XCTAssertEqual(proceedings.series, "s")
        XCTAssertEqual(proceedings.address, "a")
        XCTAssertEqual(proceedings.publisher, "p")
        XCTAssertEqual(proceedings.organization, "o")
        XCTAssertEqual(proceedings.month, .november)
        XCTAssertEqual(proceedings.note, "n")
    }
    
    func testTechReport() {
        let techReport: TechReport = testPublicationType(.techReport, fields: [
            "author": "a", "title": "t", "institution": "i", "year": "2020",
            "type": "t", "number": "1", "address": "a", "month": "dec", "note": "n"
        ], requiredField: "author")
        XCTAssertEqual(techReport.type, "t")
        XCTAssertEqual(techReport.number, 1)
        XCTAssertEqual(techReport.address, "a")
        XCTAssertEqual(techReport.month, .december)
        XCTAssertEqual(techReport.note, "n")
    }
    
    func testUnpublished() {
        let unpublished: Unpublished = testPublicationType(.unpublished, fields: [
            "author": "a", "title": "t", "note": "n",
            "month": "jan", "year": "2020"
        ], requiredField: "author")
        XCTAssertEqual(unpublished.month, .january)
        XCTAssertEqual(unpublished.year, 2020)
    }
    
    private func testPublicationType<T: Publication>(_ publicationType: PublicationType, fields: [String: String], requiredField: String?) -> T {
        if let requiredField = requiredField {
            let fieldsString1 = fields.filter { $0.key != requiredField }.map { "\($0.key) = {\($0.value)}" }.joined(separator: ", ")
            let input1 = "@\(publicationType){citationKey, \(fieldsString1)}"
            let publications1 = try! SwiftyBibtex.parse(input1, loggingLevel: .none).publications
            XCTAssertEqual(publications1.count, 1)
            XCTAssertEqual(publications1[0].publicationType, publicationType)
            XCTAssertFalse(publications1[0] is T)
        }
        
        let fieldsString2 = fields.map { "\($0.key) = {\($0.value)}" }.joined(separator: ", ")
        let input2 = "@\(publicationType){citationKey, \(fieldsString2)}"
        let publications2 = try! SwiftyBibtex.parse(input2, loggingLevel: .none).publications
        XCTAssertEqual(publications2.count, 1)
        
        let publication = publications2[0]
        XCTAssertEqual(publication.publicationType, publicationType)
        XCTAssert(publication is T)
        
        return publication as! T
    }
    
    static var allTests = [
        ("testArticle", testArticle),
        ("testBook", testBook),
        ("testBooklet", testBooklet),
        ("testInBook", testInBook),
        ("testInCollection", testInCollection),
        ("testInProceedings", testInProceedings),
        ("testManual", testManual),
        ("testMasterThesis", testMasterThesis),
        ("testMisc", testMisc),
        ("testPhdThesis", testPhdThesis),
        ("testProceedings", testProceedings),
        ("testTechReport", testTechReport),
        ("testUnpublished", testUnpublished)
    ]
}
