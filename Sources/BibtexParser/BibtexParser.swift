// Generated from BibtexParser.g4 by ANTLR 4.8
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
		case EOF = -1, TAG_VALUE_CURLY_START = 1, AT = 2, COMMA = 3, EQUALS = 4, 
                 HASH = 5, OPEN_CURLY = 6, CLOSE_CURLY = 7, STRING = 8, 
                 NAME = 9, STRING_LITERAL = 10, WS = 11, TAG_VALUE_OPEN_CURLY = 12, 
                 TAG_VALUE_CLOSE_CURLY = 13, TAG_VALUE_CURLY = 14
	}

	public
	static let RULE_root = 0, RULE_bibFile = 1, RULE_string = 2, RULE_publication = 3, 
            RULE_tags = 4, RULE_tag = 5, RULE_tagString = 6, RULE_curlyTagValue = 7

	public
	static let ruleNames: [String] = [
		"root", "bibFile", "string", "publication", "tags", "tag", "tagString", 
		"curlyTagValue"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, "'@'", "','", "'='", "'#'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "TAG_VALUE_CURLY_START", "AT", "COMMA", "EQUALS", "HASH", "OPEN_CURLY", 
		"CLOSE_CURLY", "STRING", "NAME", "STRING_LITERAL", "WS", "TAG_VALUE_OPEN_CURLY", 
		"TAG_VALUE_CLOSE_CURLY", "TAG_VALUE_CURLY"
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
	    RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION)
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
		 	setState(16)
		 	try bibFile()
		 	setState(17)
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
		 	setState(23)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.AT.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(21)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,0, _ctx)) {
		 		case 1:
		 			setState(19)
		 			try string()

		 			break
		 		case 2:
		 			setState(20)
		 			try publication()

		 			break
		 		default: break
		 		}

		 		setState(25)
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
		 	setState(26)
		 	try match(BibtexParser.Tokens.AT.rawValue)
		 	setState(27)
		 	try match(BibtexParser.Tokens.STRING.rawValue)
		 	setState(28)
		 	try match(BibtexParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(29)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(StringContext.self).stringName = assignmentValue
		 	     }()

		 	setState(30)
		 	try match(BibtexParser.Tokens.EQUALS.rawValue)
		 	setState(31)
		 	try match(BibtexParser.Tokens.STRING_LITERAL.rawValue)
		 	setState(32)
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
			func tags() -> TagsContext? {
				return getRuleContext(TagsContext.self, 0)
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
		 	setState(34)
		 	try match(BibtexParser.Tokens.AT.rawValue)
		 	setState(35)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(PublicationContext.self).publicationType = assignmentValue
		 	     }()

		 	setState(36)
		 	try match(BibtexParser.Tokens.OPEN_CURLY.rawValue)
		 	setState(37)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(PublicationContext.self).citationKey = assignmentValue
		 	     }()

		 	setState(38)
		 	try match(BibtexParser.Tokens.COMMA.rawValue)
		 	setState(39)
		 	try tags()
		 	setState(40)
		 	try match(BibtexParser.Tokens.CLOSE_CURLY.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TagsContext: ParserRuleContext {
			open
			func tag() -> [TagContext] {
				return getRuleContexts(TagContext.self)
			}
			open
			func tag(_ i: Int) -> TagContext? {
				return getRuleContext(TagContext.self, i)
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
			return BibtexParser.RULE_tags
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterTags(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitTags(self)
			}
		}
	}
	@discardableResult
	 open func tags() throws -> TagsContext {
		var _localctx: TagsContext = TagsContext(_ctx, getState())
		try enterRule(_localctx, 8, BibtexParser.RULE_tags)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(42)
		 	try tag()
		 	setState(47)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.COMMA.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(43)
		 		try match(BibtexParser.Tokens.COMMA.rawValue)
		 		setState(44)
		 		try tag()


		 		setState(49)
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

	public class TagContext: ParserRuleContext {
		open var tagName: Token!
			open
			func TAG_VALUE_CURLY_START() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.TAG_VALUE_CURLY_START.rawValue, 0)
			}
			open
			func curlyTagValue() -> CurlyTagValueContext? {
				return getRuleContext(CurlyTagValueContext.self, 0)
			}
			open
			func TAG_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.TAG_VALUE_CLOSE_CURLY.rawValue, 0)
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
			func tagString() -> [TagStringContext] {
				return getRuleContexts(TagStringContext.self)
			}
			open
			func tagString(_ i: Int) -> TagStringContext? {
				return getRuleContext(TagStringContext.self, i)
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
			return BibtexParser.RULE_tag
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterTag(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitTag(self)
			}
		}
	}
	@discardableResult
	 open func tag() throws -> TagContext {
		var _localctx: TagContext = TagContext(_ctx, getState())
		try enterRule(_localctx, 10, BibtexParser.RULE_tag)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(65)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,4, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(50)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(TagContext.self).tagName = assignmentValue
		 		     }()

		 		setState(51)
		 		try match(BibtexParser.Tokens.TAG_VALUE_CURLY_START.rawValue)
		 		setState(52)
		 		try curlyTagValue(0)
		 		setState(53)
		 		try match(BibtexParser.Tokens.TAG_VALUE_CLOSE_CURLY.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(55)
		 		try {
		 				let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 				_localctx.castdown(TagContext.self).tagName = assignmentValue
		 		     }()

		 		setState(56)
		 		try match(BibtexParser.Tokens.EQUALS.rawValue)
		 		setState(57)
		 		try tagString()
		 		setState(62)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == BibtexParser.Tokens.HASH.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(58)
		 			try match(BibtexParser.Tokens.HASH.rawValue)
		 			setState(59)
		 			try tagString()


		 			setState(64)
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

	public class TagStringContext: ParserRuleContext {
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
			return BibtexParser.RULE_tagString
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterTagString(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitTagString(self)
			}
		}
	}
	@discardableResult
	 open func tagString() throws -> TagStringContext {
		var _localctx: TagStringContext = TagStringContext(_ctx, getState())
		try enterRule(_localctx, 12, BibtexParser.RULE_tagString)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(67)
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


	public class CurlyTagValueContext: ParserRuleContext {
			open
			func TAG_VALUE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.TAG_VALUE_CURLY.rawValue, 0)
			}
			open
			func curlyTagValue() -> [CurlyTagValueContext] {
				return getRuleContexts(CurlyTagValueContext.self)
			}
			open
			func curlyTagValue(_ i: Int) -> CurlyTagValueContext? {
				return getRuleContext(CurlyTagValueContext.self, i)
			}
			open
			func TAG_VALUE_OPEN_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.TAG_VALUE_OPEN_CURLY.rawValue, 0)
			}
			open
			func TAG_VALUE_CLOSE_CURLY() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.TAG_VALUE_CLOSE_CURLY.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_curlyTagValue
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.enterCurlyTagValue(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexParserListener {
				listener.exitCurlyTagValue(self)
			}
		}
	}

	 public final  func curlyTagValue( ) throws -> CurlyTagValueContext   {
		return try curlyTagValue(0)
	}
	@discardableResult
	private func curlyTagValue(_ _p: Int) throws -> CurlyTagValueContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: CurlyTagValueContext = CurlyTagValueContext(_ctx, _parentState)
		var  _prevctx: CurlyTagValueContext = _localctx
		var _startState: Int = 14
		try enterRecursionRule(_localctx, 14, BibtexParser.RULE_curlyTagValue, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(70)
			try match(BibtexParser.Tokens.TAG_VALUE_CURLY.rawValue)

			_ctx!.stop = try _input.LT(-1)
			setState(80)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,5,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = CurlyTagValueContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, BibtexParser.RULE_curlyTagValue)
					setState(72)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(73)
					try match(BibtexParser.Tokens.TAG_VALUE_OPEN_CURLY.rawValue)
					setState(74)
					try curlyTagValue(0)
					setState(75)
					try match(BibtexParser.Tokens.TAG_VALUE_CLOSE_CURLY.rawValue)
					setState(76)
					try curlyTagValue(2)

			 
				}
				setState(82)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,5,_ctx)
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
		case  7:
			return try curlyTagValue_sempred(_localctx?.castdown(CurlyTagValueContext.self), predIndex)
	    default: return true
		}
	}
	private func curlyTagValue_sempred(_ _localctx: CurlyTagValueContext!,  _ predIndex: Int) throws -> Bool {
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