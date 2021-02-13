# 📚 SwiftyBibtex

A Swift library for parsing [BibTeX](http://www.bibtex.org) files.

Disclaimer: This library is still under development.

## 📖 Usage

Prepare your input as a string. Example:

```swift
let input = """
@Article{max20,
    author={Max},
    title={SwiftyBibtex},
    journal={New Repositories},
    year={2020},
    note={A Swift library for parsing BibTeX files.}
}
@String{me="Max"}
@Preamble{"Maintained by " # me}
@Comment{TODO: Add more entries}
"""
```

### Access Publications

```swift
let result = SwiftyBibtex.parse(input)
result.publications
```

#### Publication Properties

```swift
let publication = publications[0]

publication.publicationType  // PublicationType.article
publication.citationKey      // "max20"
publication.fields           // ["author": "Max", ...]
publication.rangeInFile      // (1:0)...(12:0)
```

Note: all keys in `fields` are lowercased.

#### Publication Types

You can cast publications to any of the following types:

- `Article`
- `Book`
- `Booklet`
- `InBook`
- `InCollection`
- `InProceedings`
- `Manual`
- `MasterThesis`
- `Misc`
- `PhdThesis`
- `Proceedings`
- `TechReport`
- `Unpublished`

Each type has a set of required and optional fields that can be accessed directly. All other fields can be accessed using the `fields` property.

```swift
if let article = publication as? Article {
    article.author          // "Max"
    article.title           // "SwiftyBibtex"
    article.journal         // "New Repositories"
    article.year            // 2020
    article.fields["note"]  // Optional("A Swift library for parsing BibTeX files.")
}
```

### Access Preambles and Comments

```swift
let result = SwiftyBibtex.parse(input)
result.preambles  // ["Maintained by Max"]
result.comments   // ["TODO: Add more entries"]
```

### Access Warnings and Errors

```swift
let result = SwiftyBibtex.parse(input)
for warning in result.warnings {
    print(warning.message)
}
for error in result.errors {
    print(error.line)
    print(error.charPositionInLine)
    print(error.message)
}
```

Warnings and Errors are logged to the console automatically. You can alter this behavior by setting a different logging level:

```swift
let result = SwiftyBibtex.parse(input, loggingLevel: .warn)  // Log warnings and errors.
let result = SwiftyBibtex.parse(input, loggingLevel: .error) // Log only errors.
let result = SwiftyBibtex.parse(input, loggingLevel: .none)  // Don't log anything.
```

Warnings are represented by one of the following types:

- `DuplicateCitationKeyWarning`
- `MismatchedDataTypeWarning`
- `MissingRequiredFieldsWarning`
- `UnrecognizedPublicationTypeWarning`
- `UnusedStringDefinitionWarning`

Errors are represented by one of the following types:

- `ExtraneousInputParserError`
- `MismatchedInputParserError`
- `MissingSymbolParserError`
- `NoViableAlternativeParserError`
- `StringDefinitionNotFoundParserError`
- `TokenRecognitionParserError`

Casting a warning or an error to one of these types allows you to get more information about it:

```swift
if let extraneousInputError = error as? ExtraneousInputParserError {
    print(extraneousInputError.offendingSymbol)
    print(extraneousInputError.expectedSymbols)
}
```

## ⚙️ Installation

### Swift Package Manager

#### Xcode

Select `File > Swift Packages > Add Package Dependency...` and enter the following URL:

```
https://github.com/MaxHaertwig/SwiftyBibtex.git
```

#### Package.swift

Open `Package.swift` and add the following line to your package's dependencies:

```swift
.package(url: "https://github.com/MaxHaertwig/SwiftyBibtex.git", .branch("main"))
```

## 🦌 ANTLR

This library makes use of [ANTLR](https://www.antlr.org) to generate its underlying BibTeX parser. The lexer and parser grammers can be found in [BibtexLexer.g4](./BibtexLexer.g4) and [BibtexParser.g4](./BibtexParser.g4) respectively. If you decide to change one of the grammer files, make sure to run the `generate_bibtex_parser.sh` script to generate the new parser.

The ANTLR runtime (_Antlr4_) is included as a package dependency.

## 🤝 Contributions

Feedback, [Issues](https://github.com/MaxHaertwig/SwiftyBibtex/issues), and [Pull Requests](https://github.com/MaxHaertwig/SwiftyBibtex/pulls) are always welcome.

## 📄 License

_SwiftyBibtex_ is available under the _MIT license_. See [LICENSE](./LICENSE) for more info.
