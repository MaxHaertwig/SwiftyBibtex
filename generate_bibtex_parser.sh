#!/bin/bash

PARSER_DIR="Sources/BibtexParser"

rm -rf $PARSER_DIR

echo "Generating parser..."
antlr -Dlanguage=Swift -message-format gnu -o $PARSER_DIR *.g4

echo "Cleaning up..."
rm $PARSER_DIR/*.interp $PARSER_DIR/*.tokens 2> /dev/null

echo "Done"
