parser grammar BibtexParser;

options { tokenVocab=BibtexLexer; }

root : bibFile EOF ;
 
bibFile : ( entry )* ;
 
entry : AT entryType=NAME OPEN_CURLY citationKey=NAME COMMA tags CLOSE_CURLY ;
 
tags : tag ( COMMA tag )* ;
 
tag : tagName=NAME TAG_VALUE_CURLY_START curlyTagValue TAG_VALUE_CLOSE_CURLY 
    | tagName=NAME EQUALS STRING_LITERAL ( HASH STRING_LITERAL )* ;

curlyTagValue : TAG_VALUE_CURLY
              | curlyTagValue TAG_VALUE_OPEN_CURLY curlyTagValue TAG_VALUE_CLOSE_CURLY curlyTagValue ;
