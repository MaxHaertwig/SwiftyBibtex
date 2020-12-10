// Generated from BibtexLexer.g4 by ANTLR 4.9
import Antlr4

open class BibtexLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = BibtexLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(BibtexLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let CURLY_VALUE_START=1, AT=2, COMMA=3, EQUALS=4, HASH=5, OPEN_CURLY=6, 
            CLOSE_CURLY=7, OPEN_PAREN=8, CLOSE_PAREN=9, STRING=10, COMMENT_START_CURLY=11, 
            COMMENT_START_PAREN=12, NAME=13, STRING_LITERAL=14, WS=15, CURLY_VALUE_OPEN_CURLY=16, 
            CURLY_VALUE_CLOSE_CURLY=17, CURLY_VALUE=18, PAREN_VALUE_OPEN_PAREN=19, 
            PAREN_VALUE_CLOSE_PAREN=20, PAREN_VALUE=21

	public
	static let CURLY_VALUE_MODE=1, PAREN_VALUE_MODE=2
	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE", "CURLY_VALUE_MODE", "PAREN_VALUE_MODE"
	]

	public
	static let ruleNames: [String] = [
		"CURLY_VALUE_START", "AT", "COMMA", "EQUALS", "HASH", "OPEN_CURLY", "CLOSE_CURLY", 
		"OPEN_PAREN", "CLOSE_PAREN", "STRING", "COMMENT_START", "COMMENT_START_CURLY", 
		"COMMENT_START_PAREN", "NAME", "STRING_LITERAL", "WS", "CURLY_VALUE_OPEN_CURLY", 
		"CURLY_VALUE_CLOSE_CURLY", "CURLY_VALUE", "PAREN_VALUE_OPEN_PAREN", "PAREN_VALUE_CLOSE_PAREN", 
		"PAREN_VALUE"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, "'@'", "','", "'='", "'#'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "CURLY_VALUE_START", "AT", "COMMA", "EQUALS", "HASH", "OPEN_CURLY", 
		"CLOSE_CURLY", "OPEN_PAREN", "CLOSE_PAREN", "STRING", "COMMENT_START_CURLY", 
		"COMMENT_START_PAREN", "NAME", "STRING_LITERAL", "WS", "CURLY_VALUE_OPEN_CURLY", 
		"CURLY_VALUE_CLOSE_CURLY", "CURLY_VALUE", "PAREN_VALUE_OPEN_PAREN", "PAREN_VALUE_CLOSE_PAREN", 
		"PAREN_VALUE"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


	override open
	func getVocabulary() -> Vocabulary {
		return BibtexLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.9", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, BibtexLexer._ATN, BibtexLexer._decisionToDFA, BibtexLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "BibtexLexer.g4" }

	override open
	func getRuleNames() -> [String] { return BibtexLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return BibtexLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return BibtexLexer.channelNames }

	override open
	func getModeNames() -> [String] { return BibtexLexer.modeNames }

	override open
	func getATN() -> ATN { return BibtexLexer._ATN }


	public
	static let _serializedATN: String = BibtexLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}