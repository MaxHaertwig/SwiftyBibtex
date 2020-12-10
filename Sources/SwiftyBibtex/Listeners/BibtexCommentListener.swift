import BibtexParser

internal final class BibtexCommentListener : BibtexParserBaseListener {
    private(set) var comments = [String]()

    override func exitComment(_ ctx: BibtexParser.CommentContext) {
        if let comment = ctx.curlyValue()?.getText() ?? ctx.parenValue()?.getText(), !comment.isEmpty {
            comments.append(comment)
        }
    }
}
