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
		case EOF = -1, FIELD_VALUE_CURLY_START = 1, AT = 2, COMMA = 3, EQUALS = 4, 
                 HASH = 5, OPEN_CURLY = 6, CLOSE_CURLY = 7, STRING = 8, 
                 COMMENT_START = 9, NAME = 10, STRING_LITERAL = 11, WS = 12, 
                 FIELD_VALUE_OPEN_CURLY = 13, FIELD_VALUE_CLOSE_CURLY = 14, 
                 FIELD_VALUE_CURLY = 15
	}

	public
	static let RULE_root = 0, RULE_bibFile = 1, RULE_string = 2, RULE_publication = 3, 
            RULE_fields = 4, RULE_field = 5, RULE_fieldString = 6, RULE_curlyFieldValue = 7, 
            RULE_comment = 8

	public
	static let ruleNames: [String] = [
		"root", "bibFile", "string", "publication", "fields", "field", "fieldString", 
		"curlyFieldValue", "comment"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, "'@'", "','", "'='", "'#'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "FIELD_VALUE_CURLY_START", "AT", "COMMA", "EQUALS", "HASH", "OPEN_CURLY", 
		"CLOSE_CURLY", "STRING", "COMMENT_START", "NAME", "STRING_LITERAL", "WS", 
		"FIELD_VALUE_OPEN_CURLY", "FIELD_VALUE_CLOSE_CURLY", "FIELD_VALUE_CURLY"
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
		 	setState(18)
		 	try bibFile()
		 	setState(19)
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
			func publication() -> [PublicationContext] {
				return getRuleContexts(PublicationContext.self)
			}
			open
			func publication(_ i: Int) -> PublicationContext? {
				return getRuleContext(PublicationContext.self, i)
			}
			open
			func comment() -> [CommentContext] {
				return getRuleContexts(CommentContext.self)
			}
			open
			func comment(_ i: Int) -> CommentContext? {
				return getRuleContext(CommentContext.self, i)
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
		 	setState(26)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.AT.rawValue || _la == BibtexParser.Tokens.COMMENT_START.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(24)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,0, _ctx)) {
		 		case 1:
		 			setState(21)
		 			try string()

		 			break
		 		case 2:
		 			setState(22)
		 			try publication()

		 			break
		 		case 3:
		 			setState(23)
		 			try comment()

		 			break
		 		default: break
		 		}

		 		setState(28)
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
		 	try enterOuterAlt(_localctx, 1)
		 	setState(29)
		 	try match(BibtexParser.Tokens.AT.rawValue)
		 	setState(30)
		 	try match(BibtexParser.Tokens.STRING.rawValue)
		 	setState(31)
		 	try match(BibtexParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(32)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(StringContext.self).stringName = assignmentValue
		 	     }()

		 	setState(33)
		 	try match(BibtexParser.Tokens.EQUALS.rawValue)
		 	setState(34)
		 	try match(BibtexParser.Tokens.STRING_LITERAL.rawValue)
		 	setState(35)
		 	try match(BibtexParser.Tokens.CLOSE_CURLY.rawValue)

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
		try enterRule(_localctx, 6, BibtexParser.RULE_publication)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(37)
		 	try match(BibtexParser.Tokens.AT.rawValue)
		 	setState(38)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(PublicationContext.self).publicationType = assignmentValue
		 	     }()

		 	setState(39)
		 	try match(BibtexParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(40)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(PublicationContext.self).citationKey = assignmentValue
		 	     }()

		 	setState(41)
		 	try match(BibtexParser.Tokens.COMMA.rawValue)
		 	setState(42)
		 	try fields()
		 	setState(43)
		 	try match(BibtexParser.Tokens.CLOSE_CURLY.rawValue)

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
		try enterRule(_localctx, 8, BibtexParser.RULE_fields)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(45)
		 	try field()
		 	setState(50)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,2,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(46)
		 			try match(BibtexParser.Tokens.COMMA.rawValue)
		 			setState(47)
		 			try field()

		 	 
		 		}
		 		setState(52)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,2,_ctx)
		 	}
		 	setState(54)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.COMMA.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(53)
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
			func FIELD_VALUE_CURLY_START() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.FIELD_VALUE_CURLY_START.rawValue, 0)
			}
			open
			func curlyFieldValue() -> CurlyFieldValueContext? {
				return getRuleContext(CurlyFieldValueContext.self, 0)
			}
			open
			func FIELD_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.FIELD_VALUE_CLOSE_CURLY.rawValue, 0)
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
		try enterRule(_localctx, 10, BibtexParser.RULE_field)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(71)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(56)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(FieldContext.self).fieldName = assignmentValue
		 		     }()

		 		setState(57)
		 		try match(BibtexParser.Tokens.FIELD_VALUE_CURLY_START.rawValue)
		 		setState(58)
		 		try curlyFieldValue(0)
		 		setState(59)
		 		try match(BibtexParser.Tokens.FIELD_VALUE_CLOSE_CURLY.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(61)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(FieldContext.self).fieldName = assignmentValue
		 		     }()

		 		setState(62)
		 		try match(BibtexParser.Tokens.EQUALS.rawValue)
		 		setState(63)
		 		try fieldString()
		 		setState(68)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BibtexParser.Tokens.HASH.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(64)
		 			try match(BibtexParser.Tokens.HASH.rawValue)
		 			setState(65)
		 			try fieldString()


		 			setState(70)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

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
		try enterRule(_localctx, 12, BibtexParser.RULE_fieldString)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(73)
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


	public class CurlyFieldValueContext: ParserRuleContext {
			open
			func FIELD_VALUE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.FIELD_VALUE_CURLY.rawValue, 0)
			}
			open
			func curlyFieldValue() -> [CurlyFieldValueContext] {
				return getRuleContexts(CurlyFieldValueContext.self)
			}
			open
			func curlyFieldValue(_ i: Int) -> CurlyFieldValueContext? {
				return getRuleContext(CurlyFieldValueContext.self, i)
			}
			open
			func FIELD_VALUE_OPEN_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.FIELD_VALUE_OPEN_CURLY.rawValue, 0)
			}
			open
			func FIELD_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.FIELD_VALUE_CLOSE_CURLY.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_curlyFieldValue
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterCurlyFieldValue(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitCurlyFieldValue(self)
			}
		}
	}

	 public final  func curlyFieldValue( ) throws -> CurlyFieldValueContext   {
		return try curlyFieldValue(0)
	}
	@discardableResult
	private func curlyFieldValue(_ _p: Int) throws -> CurlyFieldValueContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: CurlyFieldValueContext = CurlyFieldValueContext(_ctx, _parentState)
		var _prevctx: CurlyFieldValueContext = _localctx
		let _startState: Int = 14
		try enterRecursionRule(_localctx, 14, BibtexParser.RULE_curlyFieldValue, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(77)
			try _errHandler.sync(self)
			switch (try getInterpreter().adaptivePredict(_input,6,_ctx)) {
			case 1:
				setState(76)
				try match(BibtexParser.Tokens.FIELD_VALUE_CURLY.rawValue)

				break
			default: break
			}

			_ctx!.stop = try _input.LT(-1)
			setState(87)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = CurlyFieldValueContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, BibtexParser.RULE_curlyFieldValue)
					setState(79)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(80)
					try match(BibtexParser.Tokens.FIELD_VALUE_OPEN_CURLY.rawValue)
					setState(81)
					try curlyFieldValue(0)
					setState(82)
					try match(BibtexParser.Tokens.FIELD_VALUE_CLOSE_CURLY.rawValue)
					setState(83)
					try curlyFieldValue(2)

			 
				}
				setState(89)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class CommentContext: ParserRuleContext {
			open
			func COMMENT_START() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.COMMENT_START.rawValue, 0)
			}
			open
			func curlyFieldValue() -> CurlyFieldValueContext? {
				return getRuleContext(CurlyFieldValueContext.self, 0)
			}
			open
			func FIELD_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.FIELD_VALUE_CLOSE_CURLY.rawValue, 0)
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
		try enterRule(_localctx, 16, BibtexParser.RULE_comment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(90)
		 	try match(BibtexParser.Tokens.COMMENT_START.rawValue)
		 	setState(91)
		 	try curlyFieldValue(0)
		 	setState(92)
		 	try match(BibtexParser.Tokens.FIELD_VALUE_CLOSE_CURLY.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  7:
			return try curlyFieldValue_sempred(_localctx?.castdown(CurlyFieldValueContext.self), predIndex)
	    default: return true
		}
	}
	private func curlyFieldValue_sempred(_ _localctx: CurlyFieldValueContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 1)
		    default: return true
		}
	}


	public
	static let _serializedATN = BibtexParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}