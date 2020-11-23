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
	 * Enter a parse tree produced by {@link BibtexParser#entry}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEntry(_ ctx: BibtexParser.EntryContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#entry}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEntry(_ ctx: BibtexParser.EntryContext)
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
}