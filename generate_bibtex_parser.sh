#!/bin/bash

PARSER_DIR="Sources/BibtexParser"
rm -rf $PARSER_DIR
antlr -Dlanguage=Swift -message-format gnu -o $PARSER_DIR Bibtex.g4
rm $PARSER_DIR/*.interp $PARSER_DIR/*.tokens 2> /dev/null
