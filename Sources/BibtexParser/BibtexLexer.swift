// Generated from BibtexLexer.g4 by ANTLR 4.8
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
	static let TAG_VALUE_CURLY_START=1, TAG_VALUE_QUOTE_START=2, TAG_VALUE_CONCAT_START=3, 
            AT=4, COMMA=5, OPEN_CURLY=6, CLOSE_CURLY=7, NAME=8, WHITESPACE=9, 
            TAG_VALUE_OPEN_CURLY=10, TAG_VALUE_CLOSE_CURLY=11, TAG_VALUE_CURLY=12, 
            TAG_VALUE_CLOSE_QUOTE=13, TAG_VALUE_QUOTE=14

	public
	static let TAG_VALUE_CURLY_MODE=1, TAG_VALUE_QUOTE_MODE=2
	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE", "TAG_VALUE_CURLY_MODE", "TAG_VALUE_QUOTE_MODE"
	]

	public
	static let ruleNames: [String] = [
		"TAG_VALUE_CURLY_START", "TAG_VALUE_QUOTE_START", "TAG_VALUE_CONCAT_START", 
		"AT", "COMMA", "OPEN_CURLY", "CLOSE_CURLY", "NAME", "WHITESPACE", "TAG_VALUE_OPEN_CURLY", 
		"TAG_VALUE_CLOSE_CURLY", "TAG_VALUE_CURLY", "TAG_VALUE_CLOSE_QUOTE", "TAG_VALUE_QUOTE"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, nil, nil, "'@'", "','", nil, nil, nil, nil, nil, nil, nil, "'\"'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "TAG_VALUE_CURLY_START", "TAG_VALUE_QUOTE_START", "TAG_VALUE_CONCAT_START", 
		"AT", "COMMA", "OPEN_CURLY", "CLOSE_CURLY", "NAME", "WHITESPACE", "TAG_VALUE_OPEN_CURLY", 
		"TAG_VALUE_CLOSE_CURLY", "TAG_VALUE_CURLY", "TAG_VALUE_CLOSE_QUOTE", "TAG_VALUE_QUOTE"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


	override open
	func getVocabulary() -> Vocabulary {
		return BibtexLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION)
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