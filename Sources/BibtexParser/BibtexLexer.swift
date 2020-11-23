// Generated from Bibtex.g4 by ANTLR 4.8
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
	static let T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, NAME=6, TAG_VALUE=7

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"T__0", "T__1", "T__2", "T__3", "T__4", "NAME", "TAG_VALUE"
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
	func getGrammarFileName() -> String { return "Bibtex.g4" }

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