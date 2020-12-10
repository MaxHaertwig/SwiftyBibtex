parser grammar BibtexParser;

options { tokenVocab=BibtexLexer; }

root : bibFile EOF ;
 
bibFile : ( string | comment | publication )* ;
 
string : AT STRING OPEN_CURLY stringName=NAME EQUALS STRING_LITERAL CLOSE_CURLY
       | AT STRING OPEN_PAREN stringName=NAME EQUALS STRING_LITERAL CLOSE_PAREN ;

comment : COMMENT_START_CURLY curlyValue CURLY_VALUE_CLOSE_CURLY
        | COMMENT_START_PAREN parenValue PAREN_VALUE_CLOSE_PAREN ;

publication : AT publicationType=NAME OPEN_CURLY citationKey=NAME COMMA fields CLOSE_CURLY
            | AT publicationType=NAME OPEN_PAREN citationKey=NAME COMMA fields CLOSE_PAREN ;
 
fields : field ( COMMA field )* COMMA? ;
 
field : fieldName=NAME CURLY_VALUE_START curlyValue CURLY_VALUE_CLOSE_CURLY
      | fieldName=NAME EQUALS fieldString ( HASH fieldString )* ;

fieldString : NAME | STRING_LITERAL ;

curlyValue : CURLY_VALUE?
           | curlyValue CURLY_VALUE_OPEN_CURLY curlyValue CURLY_VALUE_CLOSE_CURLY curlyValue ;

parenValue : PAREN_VALUE?
           | parenValue PAREN_VALUE_OPEN_PAREN parenValue PAREN_VALUE_CLOSE_PAREN parenValue ;
