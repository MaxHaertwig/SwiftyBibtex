// Generated from BibtexParser.g4 by ANTLR 4.9
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
	 * Enter a parse tree produced by {@link BibtexParser#string}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterString(_ ctx: BibtexParser.StringContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#string}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitString(_ ctx: BibtexParser.StringContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#preamble}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPreamble(_ ctx: BibtexParser.PreambleContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#preamble}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPreamble(_ ctx: BibtexParser.PreambleContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#comment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterComment(_ ctx: BibtexParser.CommentContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#comment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitComment(_ ctx: BibtexParser.CommentContext)
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
	 * Enter a parse tree produced by {@link BibtexParser#fields}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFields(_ ctx: BibtexParser.FieldsContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#fields}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFields(_ ctx: BibtexParser.FieldsContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterField(_ ctx: BibtexParser.FieldContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#field}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitField(_ ctx: BibtexParser.FieldContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#concatString}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConcatString(_ ctx: BibtexParser.ConcatStringContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#concatString}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConcatString(_ ctx: BibtexParser.ConcatStringContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#fieldString}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFieldString(_ ctx: BibtexParser.FieldStringContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#fieldString}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFieldString(_ ctx: BibtexParser.FieldStringContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#curlyValue}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCurlyValue(_ ctx: BibtexParser.CurlyValueContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#curlyValue}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCurlyValue(_ ctx: BibtexParser.CurlyValueContext)
	/**
	 * Enter a parse tree produced by {@link BibtexParser#parenValue}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParenValue(_ ctx: BibtexParser.ParenValueContext)
	/**
	 * Exit a parse tree produced by {@link BibtexParser#parenValue}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParenValue(_ ctx: BibtexParser.ParenValueContext)
}