parser grammar BibtexParser;

options { tokenVocab=BibtexLexer; }

root : bibFile EOF ;
 
bibFile : ( string | publication )* ;
 
string : AT STRING OPEN_CURLY stringName=NAME EQUALS STRING_LITERAL CLOSE_CURLY ;

publication : AT publicationType=NAME OPEN_CURLY citationKey=NAME COMMA fields CLOSE_CURLY ;
 
fields : field ( COMMA field )* COMMA? ;
 
field : fieldName=NAME FIELD_VALUE_CURLY_START curlyFieldValue FIELD_VALUE_CLOSE_CURLY 
      | fieldName=NAME EQUALS fieldString ( HASH fieldString )* ;

fieldString : NAME | STRING_LITERAL ;

curlyFieldValue : FIELD_VALUE_CURLY?
                | curlyFieldValue FIELD_VALUE_OPEN_CURLY curlyFieldValue FIELD_VALUE_CLOSE_CURLY curlyFieldValue ;
