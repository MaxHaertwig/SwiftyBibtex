public enum PublicationType: Equatable, CustomStringConvertible {
    case article, book, booklet, inBook, inCollection, inProceedings, manual, masterThesis, misc, phdThesis, proceedings, techReport, unpublished
    case other(String)
    
    init(_ type: String) {
        if type == "article" { self = .article }
        else if type == "book" { self = .book }
        else if type == "booklet" { self = .booklet }
        else if type == "inbook" { self = .inBook }
        else if type == "incollection" { self = .inCollection }
        else if type == "inproceedings" { self = .inProceedings }
        else if type == "manual" { self = .manual }
        else if type == "masterthesis" { self = .masterThesis }
        else if type == "misc" { self = .misc }
        else if type == "phdthesis" { self = .phdThesis }
        else if type == "proceedings" { self = .proceedings }
        else if type == "techreport" { self = .techReport }
        else if type == "unpublished" { self = .unpublished }
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
}

public protocol Publication {
    var publicationType: PublicationType { get }
    var citationKey: String { get }
    var fields: [String: String] { get }
}
