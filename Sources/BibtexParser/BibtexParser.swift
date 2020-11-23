// Generated from Bibtex.g4 by ANTLR 4.8
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
		case EOF = -1, T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, NAME = 6, 
                 TAG_VALUE = 7
	}

	public
	static let RULE_root = 0, RULE_bibFile = 1, RULE_entry = 2, RULE_tags = 3, 
            RULE_tag = 4

	public
	static let ruleNames: [String] = [
		"root", "bibFile", "entry", "tags", "tag"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'@'", "'{'", "','", "'}'", "'='"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, "NAME", "TAG_VALUE"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Bibtex.g4" }

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
			if let listener = listener as? BibtexListener {
				listener.enterRoot(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
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
		 	setState(10)
		 	try bibFile()
		 	setState(11)
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
			func entry() -> [EntryContext] {
				return getRuleContexts(EntryContext.self)
			}
			open
			func entry(_ i: Int) -> EntryContext? {
				return getRuleContext(EntryContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_bibFile
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
				listener.enterBibFile(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
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
		 	setState(16)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.T__0.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(13)
		 		try entry()


		 		setState(18)
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

	public class EntryContext: ParserRuleContext {
		open var entryType: Token!
		open var citationKey: Token!
			open
			func tags() -> TagsContext? {
				return getRuleContext(TagsContext.self, 0)
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
			return BibtexParser.RULE_entry
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
				listener.enterEntry(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
				listener.exitEntry(self)
			}
		}
	}
	@discardableResult
	 open func entry() throws -> EntryContext {
		var _localctx: EntryContext = EntryContext(_ctx, getState())
		try enterRule(_localctx, 4, BibtexParser.RULE_entry)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(19)
		 	try match(BibtexParser.Tokens.T__0.rawValue)
		 	setState(20)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(EntryContext.self).entryType = assignmentValue
		 	     }()

		 	setState(21)
		 	try match(BibtexParser.Tokens.T__1.rawValue)
		 	setState(22)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(EntryContext.self).citationKey = assignmentValue
		 	     }()

		 	setState(23)
		 	try match(BibtexParser.Tokens.T__2.rawValue)
		 	setState(24)
		 	try tags()
		 	setState(25)
		 	try match(BibtexParser.Tokens.T__3.rawValue)

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
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_tags
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
				listener.enterTags(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
				listener.exitTags(self)
			}
		}
	}
	@discardableResult
	 open func tags() throws -> TagsContext {
		var _localctx: TagsContext = TagsContext(_ctx, getState())
		try enterRule(_localctx, 6, BibtexParser.RULE_tags)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(27)
		 	try tag()
		 	setState(32)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == BibtexParser.Tokens.T__2.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(28)
		 		try match(BibtexParser.Tokens.T__2.rawValue)
		 		setState(29)
		 		try tag()


		 		setState(34)
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
		open var tagValue: Token!
			open
			func NAME() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.NAME.rawValue, 0)
			}
			open
			func TAG_VALUE() -> TerminalNode? {
				return getToken(BibtexParser.Tokens.TAG_VALUE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return BibtexParser.RULE_tag
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
				listener.enterTag(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? BibtexListener {
				listener.exitTag(self)
			}
		}
	}
	@discardableResult
	 open func tag() throws -> TagContext {
		var _localctx: TagContext = TagContext(_ctx, getState())
		try enterRule(_localctx, 8, BibtexParser.RULE_tag)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(35)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.NAME.rawValue)
		 			_localctx.castdown(TagContext.self).tagName = assignmentValue
		 	     }()

		 	setState(36)
		 	try match(BibtexParser.Tokens.T__4.rawValue)
		 	setState(37)
		 	try {
		 			let assignmentValue = try match(BibtexParser.Tokens.TAG_VALUE.rawValue)
		 			_localctx.castdown(TagContext.self).tagValue = assignmentValue
		 	     }()


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = BibtexParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}