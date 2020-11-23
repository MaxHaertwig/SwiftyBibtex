parser grammar BibtexParser;

options { tokenVocab=BibtexLexer; }

root : bibFile EOF ;
 
bibFile : ( entry )* ;
 
entry : AT entryType=NAME OPEN_CURLY citationKey=NAME COMMA tags CLOSE_CURLY ;
 
tags : tag ( COMMA tag )* ;
 
tag : tagName=NAME TAG_VALUE_CURLY_START curlyTagValue TAG_VALUE_CLOSE_CURLY 
    | tagName=NAME TAG_VALUE_QUOTE_START TAG_VALUE_QUOTE TAG_VALUE_CLOSE_QUOTE (TAG_VALUE_CONCAT_START TAG_VALUE_QUOTE TAG_VALUE_CLOSE_QUOTE)* ;

curlyTagValue : TAG_VALUE_CURLY
              | curlyTagValue TAG_VALUE_OPEN_CURLY curlyTagValue TAG_VALUE_CLOSE_CURLY curlyTagValue ;
