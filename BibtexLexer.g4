lexer grammar BibtexLexer;

TAG_VALUE_CURLY_START : '=' OPTIONAL_WS '{' -> pushMode(TAG_VALUE_CURLY_MODE) ;

AT : '@' ;
COMMA : ',' ;
EQUALS : '=' ;
HASH : '#' ;

OPEN_CURLY : '{' ;
CLOSE_CURLY : '}' ;

NAME : [0-9a-zA-Z!?$&*+./:;^<>_`|[\]\-]+ ;

STRING_LITERAL : '"' ~["]* '"' ;

WS : [ \t\r\n]+ -> skip ;

fragment OPTIONAL_WS : [ \t\r\n]* ;


mode TAG_VALUE_CURLY_MODE;

TAG_VALUE_OPEN_CURLY : '{' -> pushMode(TAG_VALUE_CURLY_MODE) ;
TAG_VALUE_CLOSE_CURLY : '}' -> popMode ;

TAG_VALUE_CURLY: ~[{}]+ ;
