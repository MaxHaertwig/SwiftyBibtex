# SwiftyBibtex

A Swift library for parsing [Bibtex](http://www.bibtex.org) files.

## Usage

Prepare your input as a string. Example:

```swift
let input = """
@Article{max20,
    author={Max},
    title={SwiftyBibtex},
    journal={New Repositories},
    year={2020},
    note={A Swift library for parsing Bibtex files.}
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
```

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
    article.fields["note"]  // Optional("A Swift library for parsing Bibtex files.")
}
```

### Access Preambles and Comments

```swift
let result = SwiftyBibtex.parse(input)
result.preambles  // ["Maintained by Max"]
result.comments   // ["TODO: Add more entries"]
```

### Access Errors

```swift
let result = SwiftyBibtex.parse(input)
for error in result.errors {
    print(error.line)
    print(error.charPositionInLine)
    print(error.message)
}
```

## Installation

### Swift Package Manager

#### Xcode

Select `File > Swift Packages > Add Package Dependency...` and enter the following URL:

```
https://github.com/MaxHaertwig/SwiftyBibtex.git
```

#### Package.swift

Open `Package.swift` and add the following line to your package's dependencies:

```swift
.package(url: "https://github.com/MaxHaertwig/SwiftyBibtex.git", .upToNextManjor(from: "1.0.0"))
```
