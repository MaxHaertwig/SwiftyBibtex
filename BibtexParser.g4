parser grammar BibtexParser;

options { tokenVocab=BibtexLexer; }

root : bibFile EOF ;
 
bibFile : ( string | comment | publication )* ;
 
string : AT STRING OPEN_CURLY stringName=NAME EQUALS STRING_LITERAL CLOSE_CURLY ;

comment: COMMENT_START curlyFieldValue CURLY_VALUE_CLOSE_CURLY ;

publication : AT publicationType=NAME OPEN_CURLY citationKey=NAME COMMA fields CLOSE_CURLY ;
 
fields : field ( COMMA field )* COMMA? ;
 
field : fieldName=NAME CURLY_VALUE_START curlyFieldValue CURLY_VALUE_CLOSE_CURLY
      | fieldName=NAME EQUALS fieldString ( HASH fieldString )* ;

fieldString : NAME | STRING_LITERAL ;

curlyFieldValue : CURLY_VALUE?
                | curlyFieldValue CURLY_VALUE_OPEN_CURLY curlyFieldValue CURLY_VALUE_CLOSE_CURLY curlyFieldValue ;
