// Generated from BibtexParser.g4 by ANTLR 4.8
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link BibtexParser}.
 */
public protocol BibtexParserListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link BibtexParser#root}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRoot(_ ctx: BibtexParser.RootContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#root}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRoot(_ ctx: BibtexParser.RootContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#bibFile}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBibFile(_ ctx: BibtexParser.BibFileContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#bibFile}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBibFile(_ ctx: BibtexParser.BibFileContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#publication}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPublication(_ ctx: BibtexParser.PublicationContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#publication}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPublication(_ ctx: BibtexParser.PublicationContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#tags}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTags(_ ctx: BibtexParser.TagsContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#tags}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTags(_ ctx: BibtexParser.TagsContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#tag}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTag(_ ctx: BibtexParser.TagContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#tag}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTag(_ ctx: BibtexParser.TagContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#curlyTagValue}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCurlyTagValue(_ ctx: BibtexParser.CurlyTagValueContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#curlyTagValue}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCurlyTagValue(_ ctx: BibtexParser.CurlyTagValueContext)
}