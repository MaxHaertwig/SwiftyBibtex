// Generated from BibtexParser.g4 by ANTLR 4.9
import Antlr4

open class BibtexParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = BibtexParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(BibtexParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, CURLY_VALUE_START = 1, AT = 2, COMMA = 3, EQUALS = 4, HASH = 5, 
                 OPEN_CURLY = 6, CLOSE_CURLY = 7, OPEN_PAREN = 8, CLOSE_PAREN = 9, 
                 STRING = 10, PREAMBLE = 11, COMMENT_START_CURLY = 12, COMMENT_START_PAREN = 13, 
                 NAME = 14, STRING_LITERAL = 15, WS = 16, CURLY_VALUE_OPEN_CURLY = 17, 
                 CURLY_VALUE_CLOSE_CURLY = 18, CURLY_VALUE = 19, PAREN_VALUE_OPEN_PAREN = 20, 
                 PAREN_VALUE_CLOSE_PAREN = 21, PAREN_VALUE = 22
	}

	public
	static let RULE_root = 0, RULE_bibFile = 1, RULE_string = 2, RULE_preamble = 3, 
            RULE_comment = 4, RULE_publication = 5, RULE_fields = 6, RULE_field = 7, 
            RULE_concatString = 8, RULE_fieldString = 9, RULE_curlyValue = 10, 
            RULE_parenValue = 11

	public
	static let ruleNames: [String] = [
		"root", "bibFile", "string", "preamble", "comment", "publication", "fields", 
		"field", "concatString", "fieldString", "curlyValue", "parenValue"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, "'@'", "','", "'='", "'#'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "CURLY_VALUE_START", "AT", "COMMA", "EQUALS", "HASH", "OPEN_CURLY", 
		"CLOSE_CURLY", "OPEN_PAREN", "CLOSE_PAREN", "STRING", "PREAMBLE", "COMMENT_START_CURLY", 
		"COMMENT_START_PAREN", "NAME", "STRING_LITERAL", "WS", "CURLY_VALUE_OPEN_CURLY", 
		"CURLY_VALUE_CLOSE_CURLY", "CURLY_VALUE", "PAREN_VALUE_OPEN_PAREN", "PAREN_VALUE_CLOSE_PAREN", 
		"PAREN_VALUE"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "BibtexParser.g4" }

	override open
	func getRuleNames() -> [String] { return BibtexParser.ruleNames }

	override open
	func getSerializedATN() -> String { return BibtexParser._serializedATN }

	override open
	func getATN() -> ATN { return BibtexParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return BibtexParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.9", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,BibtexParser._ATN,BibtexParser._decisionToDFA, BibtexParser._sharedContextCache)
	}


	public class RootContext: ParserRuleContext {
			open
			func bibFile() -> BibFileContext? {
				return getRuleContext(BibFileContext.self, 0)
			}
			open
			func EOF() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.EOF.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_root
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterRoot(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitRoot(self)
			}
		}
	}
	@discardableResult
	 open func root() throws -> RootContext {
		var _localctx: RootContext = RootContext(_ctx, getState())
		try enterRule(_localctx, 0, BibtexParser.RULE_root)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(24)
		 	try bibFile()
		 	setState(25)
		 	try match(BibtexParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BibFileContext: ParserRuleContext {
			open
			func string() -> [StringContext] {
				return getRuleContexts(StringContext.self)
			}
			open
			func string(_ i: Int) -> StringContext? {
				return getRuleContext(StringContext.self, i)
			}
			open
			func preamble() -> [PreambleContext] {
				return getRuleContexts(PreambleContext.self)
			}
			open
			func preamble(_ i: Int) -> PreambleContext? {
				return getRuleContext(PreambleContext.self, i)
			}
			open
			func comment() -> [CommentContext] {
				return getRuleContexts(CommentContext.self)
			}
			open
			func comment(_ i: Int) -> CommentContext? {
				return getRuleContext(CommentContext.self, i)
			}
			open
			func publication() -> [PublicationContext] {
				return getRuleContexts(PublicationContext.self)
			}
			open
			func publication(_ i: Int) -> PublicationContext? {
				return getRuleContext(PublicationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_bibFile
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterBibFile(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitBibFile(self)
			}
		}
	}
	@discardableResult
	 open func bibFile() throws -> BibFileContext {
		var _localctx: BibFileContext = BibFileContext(_ctx, getState())
		try enterRule(_localctx, 2, BibtexParser.RULE_bibFile)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(33)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, BibtexParser.Tokens.AT.rawValue,BibtexParser.Tokens.COMMENT_START_CURLY.rawValue,BibtexParser.Tokens.COMMENT_START_PAREN.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(31)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,0, _ctx)) {
		 		case 1:
		 			setState(27)
		 			try string()

		 			break
		 		case 2:
		 			setState(28)
		 			try preamble()

		 			break
		 		case 3:
		 			setState(29)
		 			try comment()

		 			break
		 		case 4:
		 			setState(30)
		 			try publication()

		 			break
		 		default: break
		 		}

		 		setState(35)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StringContext: ParserRuleContext {
		open var stringName: Token!
			open
			func AT() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.AT.rawValue, 0)
			}
			open
			func STRING() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.STRING.rawValue, 0)
			}
			open
			func OPEN_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.OPEN_CURLY.rawValue, 0)
			}
			open
			func EQUALS() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.EQUALS.rawValue, 0)
			}
			open
			func STRING_LITERAL() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.STRING_LITERAL.rawValue, 0)
			}
			open
			func CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CLOSE_CURLY.rawValue, 0)
			}
			open
			func NAME() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.NAME.rawValue, 0)
			}
			open
			func OPEN_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.OPEN_PAREN.rawValue, 0)
			}
			open
			func CLOSE_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CLOSE_PAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_string
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterString(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitString(self)
			}
		}
	}
	@discardableResult
	 open func string() throws -> StringContext {
		var _localctx: StringContext = StringContext(_ctx, getState())
		try enterRule(_localctx, 4, BibtexParser.RULE_string)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(50)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,2, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(36)
		 		try match(BibtexParser.Tokens.AT.rawValue)
		 		setState(37)
		 		try match(BibtexParser.Tokens.STRING.rawValue)
		 		setState(38)
		 		try match(BibtexParser.Tokens.OPEN_CURLY.rawValue)
		 		setState(39)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(StringContext.self).stringName = assignmentValue
		 		     }()

		 		setState(40)
		 		try match(BibtexParser.Tokens.EQUALS.rawValue)
		 		setState(41)
		 		try match(BibtexParser.Tokens.STRING_LITERAL.rawValue)
		 		setState(42)
		 		try match(BibtexParser.Tokens.CLOSE_CURLY.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(43)
		 		try match(BibtexParser.Tokens.AT.rawValue)
		 		setState(44)
		 		try match(BibtexParser.Tokens.STRING.rawValue)
		 		setState(45)
		 		try match(BibtexParser.Tokens.OPEN_PAREN.rawValue)
		 		setState(46)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(StringContext.self).stringName = assignmentValue
		 		     }()

		 		setState(47)
		 		try match(BibtexParser.Tokens.EQUALS.rawValue)
		 		setState(48)
		 		try match(BibtexParser.Tokens.STRING_LITERAL.rawValue)
		 		setState(49)
		 		try match(BibtexParser.Tokens.CLOSE_PAREN.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PreambleContext: ParserRuleContext {
			open
			func AT() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.AT.rawValue, 0)
			}
			open
			func PREAMBLE() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.PREAMBLE.rawValue, 0)
			}
			open
			func OPEN_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.OPEN_CURLY.rawValue, 0)
			}
			open
			func concatString() -> ConcatStringContext? {
				return getRuleContext(ConcatStringContext.self, 0)
			}
			open
			func CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CLOSE_CURLY.rawValue, 0)
			}
			open
			func OPEN_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.OPEN_PAREN.rawValue, 0)
			}
			open
			func CLOSE_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CLOSE_PAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_preamble
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterPreamble(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitPreamble(self)
			}
		}
	}
	@discardableResult
	 open func preamble() throws -> PreambleContext {
		var _localctx: PreambleContext = PreambleContext(_ctx, getState())
		try enterRule(_localctx, 6, BibtexParser.RULE_preamble)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(64)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(52)
		 		try match(BibtexParser.Tokens.AT.rawValue)
		 		setState(53)
		 		try match(BibtexParser.Tokens.PREAMBLE.rawValue)
		 		setState(54)
		 		try match(BibtexParser.Tokens.OPEN_CURLY.rawValue)
		 		setState(55)
		 		try concatString()
		 		setState(56)
		 		try match(BibtexParser.Tokens.CLOSE_CURLY.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(58)
		 		try match(BibtexParser.Tokens.AT.rawValue)
		 		setState(59)
		 		try match(BibtexParser.Tokens.PREAMBLE.rawValue)
		 		setState(60)
		 		try match(BibtexParser.Tokens.OPEN_PAREN.rawValue)
		 		setState(61)
		 		try concatString()
		 		setState(62)
		 		try match(BibtexParser.Tokens.CLOSE_PAREN.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CommentContext: ParserRuleContext {
			open
			func COMMENT_START_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.COMMENT_START_CURLY.rawValue, 0)
			}
			open
			func curlyValue() -> CurlyValueContext? {
				return getRuleContext(CurlyValueContext.self, 0)
			}
			open
			func CURLY_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CURLY_VALUE_CLOSE_CURLY.rawValue, 0)
			}
			open
			func COMMENT_START_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.COMMENT_START_PAREN.rawValue, 0)
			}
			open
			func parenValue() -> ParenValueContext? {
				return getRuleContext(ParenValueContext.self, 0)
			}
			open
			func PAREN_VALUE_CLOSE_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.PAREN_VALUE_CLOSE_PAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_comment
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterComment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitComment(self)
			}
		}
	}
	@discardableResult
	 open func comment() throws -> CommentContext {
		var _localctx: CommentContext = CommentContext(_ctx, getState())
		try enterRule(_localctx, 8, BibtexParser.RULE_comment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(74)
		 	try _errHandler.sync(self)
		 	switch (BibtexParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .COMMENT_START_CURLY:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(66)
		 		try match(BibtexParser.Tokens.COMMENT_START_CURLY.rawValue)
		 		setState(67)
		 		try curlyValue(0)
		 		setState(68)
		 		try match(BibtexParser.Tokens.CURLY_VALUE_CLOSE_CURLY.rawValue)

		 		break

		 	case .COMMENT_START_PAREN:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(70)
		 		try match(BibtexParser.Tokens.COMMENT_START_PAREN.rawValue)
		 		setState(71)
		 		try parenValue(0)
		 		setState(72)
		 		try match(BibtexParser.Tokens.PAREN_VALUE_CLOSE_PAREN.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PublicationContext: ParserRuleContext {
		open var publicationType: Token!
		open var citationKey: Token!
			open
			func AT() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.AT.rawValue, 0)
			}
			open
			func OPEN_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.OPEN_CURLY.rawValue, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func fields() -> FieldsContext? {
				return getRuleContext(FieldsContext.self, 0)
			}
			open
			func CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CLOSE_CURLY.rawValue, 0)
			}
			open
			func NAME() -> [TerminalNode] {
				return getTokens(BibtexParser.Tokens.NAME.rawValue)
			}
			open
			func NAME(_ i:Int) -> TerminalNode? {
				return getToken(BibtexParser.Tokens.NAME.rawValue, i)
			}
			open
			func OPEN_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.OPEN_PAREN.rawValue, 0)
			}
			open
			func CLOSE_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CLOSE_PAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_publication
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterPublication(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitPublication(self)
			}
		}
	}
	@discardableResult
	 open func publication() throws -> PublicationContext {
		var _localctx: PublicationContext = PublicationContext(_ctx, getState())
		try enterRule(_localctx, 10, BibtexParser.RULE_publication)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(92)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(76)
		 		try match(BibtexParser.Tokens.AT.rawValue)
		 		setState(77)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(PublicationContext.self).publicationType = assignmentValue
		 		     }()

		 		setState(78)
		 		try match(BibtexParser.Tokens.OPEN_CURLY.rawValue)
		 		setState(79)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(PublicationContext.self).citationKey = assignmentValue
		 		     }()

		 		setState(80)
		 		try match(BibtexParser.Tokens.COMMA.rawValue)
		 		setState(81)
		 		try fields()
		 		setState(82)
		 		try match(BibtexParser.Tokens.CLOSE_CURLY.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(84)
		 		try match(BibtexParser.Tokens.AT.rawValue)
		 		setState(85)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(PublicationContext.self).publicationType = assignmentValue
		 		     }()

		 		setState(86)
		 		try match(BibtexParser.Tokens.OPEN_PAREN.rawValue)
		 		setState(87)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(PublicationContext.self).citationKey = assignmentValue
		 		     }()

		 		setState(88)
		 		try match(BibtexParser.Tokens.COMMA.rawValue)
		 		setState(89)
		 		try fields()
		 		setState(90)
		 		try match(BibtexParser.Tokens.CLOSE_PAREN.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FieldsContext: ParserRuleContext {
			open
			func field() -> [FieldContext] {
				return getRuleContexts(FieldContext.self)
			}
			open
			func field(_ i: Int) -> FieldContext? {
				return getRuleContext(FieldContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(BibtexParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(BibtexParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_fields
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterFields(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitFields(self)
			}
		}
	}
	@discardableResult
	 open func fields() throws -> FieldsContext {
		var _localctx: FieldsContext = FieldsContext(_ctx, getState())
		try enterRule(_localctx, 12, BibtexParser.RULE_fields)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(94)
		 	try field()
		 	setState(99)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(95)
		 			try match(BibtexParser.Tokens.COMMA.rawValue)
		 			setState(96)
		 			try field()

		 	 
		 		}
		 		setState(101)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	}
		 	setState(103)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.COMMA.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(102)
		 		try match(BibtexParser.Tokens.COMMA.rawValue)

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FieldContext: ParserRuleContext {
		open var fieldName: Token!
			open
			func CURLY_VALUE_START() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CURLY_VALUE_START.rawValue, 0)
			}
			open
			func curlyValue() -> CurlyValueContext? {
				return getRuleContext(CurlyValueContext.self, 0)
			}
			open
			func CURLY_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CURLY_VALUE_CLOSE_CURLY.rawValue, 0)
			}
			open
			func NAME() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.NAME.rawValue, 0)
			}
			open
			func EQUALS() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.EQUALS.rawValue, 0)
			}
			open
			func concatString() -> ConcatStringContext? {
				return getRuleContext(ConcatStringContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_field
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterField(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitField(self)
			}
		}
	}
	@discardableResult
	 open func field() throws -> FieldContext {
		var _localctx: FieldContext = FieldContext(_ctx, getState())
		try enterRule(_localctx, 14, BibtexParser.RULE_field)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(113)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,8, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(105)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(FieldContext.self).fieldName = assignmentValue
		 		     }()

		 		setState(106)
		 		try match(BibtexParser.Tokens.CURLY_VALUE_START.rawValue)
		 		setState(107)
		 		try curlyValue(0)
		 		setState(108)
		 		try match(BibtexParser.Tokens.CURLY_VALUE_CLOSE_CURLY.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(110)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(FieldContext.self).fieldName = assignmentValue
		 		     }()

		 		setState(111)
		 		try match(BibtexParser.Tokens.EQUALS.rawValue)
		 		setState(112)
		 		try concatString()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConcatStringContext: ParserRuleContext {
			open
			func fieldString() -> [FieldStringContext] {
				return getRuleContexts(FieldStringContext.self)
			}
			open
			func fieldString(_ i: Int) -> FieldStringContext? {
				return getRuleContext(FieldStringContext.self, i)
			}
			open
			func HASH() -> [TerminalNode] {
				return getTokens(BibtexParser.Tokens.HASH.rawValue)
			}
			open
			func HASH(_ i:Int) -> TerminalNode? {
				return getToken(BibtexParser.Tokens.HASH.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_concatString
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterConcatString(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitConcatString(self)
			}
		}
	}
	@discardableResult
	 open func concatString() throws -> ConcatStringContext {
		var _localctx: ConcatStringContext = ConcatStringContext(_ctx, getState())
		try enterRule(_localctx, 16, BibtexParser.RULE_concatString)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(115)
		 	try fieldString()
		 	setState(120)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.HASH.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(116)
		 		try match(BibtexParser.Tokens.HASH.rawValue)
		 		setState(117)
		 		try fieldString()


		 		setState(122)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FieldStringContext: ParserRuleContext {
			open
			func NAME() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.NAME.rawValue, 0)
			}
			open
			func STRING_LITERAL() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.STRING_LITERAL.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_fieldString
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterFieldString(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitFieldString(self)
			}
		}
	}
	@discardableResult
	 open func fieldString() throws -> FieldStringContext {
		var _localctx: FieldStringContext = FieldStringContext(_ctx, getState())
		try enterRule(_localctx, 18, BibtexParser.RULE_fieldString)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(123)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.NAME.rawValue || _la == BibtexParser.Tokens.STRING_LITERAL.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public class CurlyValueContext: ParserRuleContext {
			open
			func CURLY_VALUE() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CURLY_VALUE.rawValue, 0)
			}
			open
			func curlyValue() -> [CurlyValueContext] {
				return getRuleContexts(CurlyValueContext.self)
			}
			open
			func curlyValue(_ i: Int) -> CurlyValueContext? {
				return getRuleContext(CurlyValueContext.self, i)
			}
			open
			func CURLY_VALUE_OPEN_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CURLY_VALUE_OPEN_CURLY.rawValue, 0)
			}
			open
			func CURLY_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.CURLY_VALUE_CLOSE_CURLY.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_curlyValue
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterCurlyValue(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitCurlyValue(self)
			}
		}
	}

	 public final  func curlyValue( ) throws -> CurlyValueContext   {
		return try curlyValue(0)
	}
	@discardableResult
	private func curlyValue(_ _p: Int) throws -> CurlyValueContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: CurlyValueContext = CurlyValueContext(_ctx, _parentState)
		var _prevctx: CurlyValueContext = _localctx
		let _startState: Int = 20
		try enterRecursionRule(_localctx, 20, BibtexParser.RULE_curlyValue, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(127)
			try _errHandler.sync(self)
			switch (try getInterpreter().adaptivePredict(_input,10,_ctx)) {
			case 1:
				setState(126)
				try match(BibtexParser.Tokens.CURLY_VALUE.rawValue)

				break
			default: break
			}

			_ctx!.stop = try _input.LT(-1)
			setState(137)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,11,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = CurlyValueContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, BibtexParser.RULE_curlyValue)
					setState(129)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(130)
					try match(BibtexParser.Tokens.CURLY_VALUE_OPEN_CURLY.rawValue)
					setState(131)
					try curlyValue(0)
					setState(132)
					try match(BibtexParser.Tokens.CURLY_VALUE_CLOSE_CURLY.rawValue)
					setState(133)
					try curlyValue(2)

			 
				}
				setState(139)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,11,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}


	public class ParenValueContext: ParserRuleContext {
			open
			func PAREN_VALUE() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.PAREN_VALUE.rawValue, 0)
			}
			open
			func parenValue() -> [ParenValueContext] {
				return getRuleContexts(ParenValueContext.self)
			}
			open
			func parenValue(_ i: Int) -> ParenValueContext? {
				return getRuleContext(ParenValueContext.self, i)
			}
			open
			func PAREN_VALUE_OPEN_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.PAREN_VALUE_OPEN_PAREN.rawValue, 0)
			}
			open
			func PAREN_VALUE_CLOSE_PAREN() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.PAREN_VALUE_CLOSE_PAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_parenValue
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterParenValue(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitParenValue(self)
			}
		}
	}

	 public final  func parenValue( ) throws -> ParenValueContext   {
		return try parenValue(0)
	}
	@discardableResult
	private func parenValue(_ _p: Int) throws -> ParenValueContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: ParenValueContext = ParenValueContext(_ctx, _parentState)
		var _prevctx: ParenValueContext = _localctx
		let _startState: Int = 22
		try enterRecursionRule(_localctx, 22, BibtexParser.RULE_parenValue, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(142)
			try _errHandler.sync(self)
			switch (try getInterpreter().adaptivePredict(_input,12,_ctx)) {
			case 1:
				setState(141)
				try match(BibtexParser.Tokens.PAREN_VALUE.rawValue)

				break
			default: break
			}

			_ctx!.stop = try _input.LT(-1)
			setState(152)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = ParenValueContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, BibtexParser.RULE_parenValue)
					setState(144)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(145)
					try match(BibtexParser.Tokens.PAREN_VALUE_OPEN_PAREN.rawValue)
					setState(146)
					try parenValue(0)
					setState(147)
					try match(BibtexParser.Tokens.PAREN_VALUE_CLOSE_PAREN.rawValue)
					setState(148)
					try parenValue(2)

			 
				}
				setState(154)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  10:
			return try curlyValue_sempred(_localctx?.castdown(CurlyValueContext.self), predIndex)
		case  11:
			return try parenValue_sempred(_localctx?.castdown(ParenValueContext.self), predIndex)
	    default: return true
		}
	}
	private func curlyValue_sempred(_ _localctx: CurlyValueContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func parenValue_sempred(_ _localctx: ParenValueContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 1:return precpred(_ctx, 1)
		    default: return true
		}
	}


	public
	static let _serializedATN = BibtexParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}