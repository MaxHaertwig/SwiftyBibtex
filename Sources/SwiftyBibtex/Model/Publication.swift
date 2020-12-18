/// A publication.
public protocol Publication {
    /// The type of the publication.
    var publicationType: PublicationType { get }

    /// The key that can be used to cite this publication.
    var citationKey: String { get }

    /// Fields containing information about the publication.
    var fields: [String: String] { get }

    /// The publication's range in its source file.
    var rangeInFile: RangeInFile { get }
}

/// The type of a publication.
public enum PublicationType: Equatable, CustomStringConvertible {
    case article, book, booklet, inBook, inCollection, inProceedings, manual, masterThesis, misc, phdThesis, proceedings, techReport, unpublished
    case other(String)
    
    init(_ type: String) {
        let lowercasedType = type.lowercased()
        if lowercasedType == "article" { self = .article }
        else if lowercasedType == "book" { self = .book }
        else if lowercasedType == "booklet" { self = .booklet }
        else if lowercasedType == "inbook" { self = .inBook }
        else if lowercasedType == "incollection" { self = .inCollection }
        else if lowercasedType == "inproceedings" { self = .inProceedings }
        else if lowercasedType == "manual" { self = .manual }
        else if lowercasedType == "masterthesis" { self = .masterThesis }
        else if lowercasedType == "misc" { self = .misc }
        else if lowercasedType == "phdthesis" { self = .phdThesis }
        else if lowercasedType == "proceedings" { self = .proceedings }
        else if lowercasedType == "techreport" { self = .techReport }
        else if lowercasedType == "unpublished" { self = .unpublished }
        else { self = .other(type) }
    }

    public var description: String {
        switch self {
        case .article:
            return "Article"
        case .book:
            return "Book"
        case .booklet:
            return "Booklet"
        case .inBook:
            return "InBook"
        case .inCollection:
            return "InCollection"
        case .inProceedings:
            return "InProceedings"
        case .manual:
            return "Manual"
        case .masterThesis:
            return "MasterThesis"
        case .misc:
            return "Misc"
        case .phdThesis:
            return "PhdThesis"
        case .proceedings:
            return "Proceedings"
        case .techReport:
            return "TechReport"
        case .unpublished:
            return "Unpublished"
        case .other(let string):
            return string
        }
    }

    internal var requiredFields: Set<String> {
        switch self {
        case .article:
            return Article.requiredFields
        case .book:
            return Book.requiredFields
        case .booklet:
            return Booklet.requiredFields
        case .inBook:
            return InBook.requiredFields
        case .inCollection:
            return InCollection.requiredFields
        case .inProceedings:
            return InProceedings.requiredFields
        case .manual:
            return Manual.requiredFields
        case .masterThesis:
            return MasterThesis.requiredFields
        case .misc:
            return Set()
        case .phdThesis:
            return PhdThesis.requiredFields
        case .proceedings:
            return Proceedings.requiredFields
        case .techReport:
            return TechReport.requiredFields
        case .unpublished:
            return Unpublished.requiredFields
        case .other:
            return Set()
        }
    }
}
