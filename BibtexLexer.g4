lexer grammar BibtexLexer;

FIELD_VALUE_CURLY_START : '=' [ \t\r\n]* '{' -> pushMode(FIELD_VALUE_CURLY_MODE) ;

AT : '@' ;
COMMA : ',' ;
EQUALS : '=' ;
HASH : '#' ;

OPEN_CURLY : '{' ;
CLOSE_CURLY : '}' ;

STRING : [sS] [tT] [rR] [iI] [nN] [gG] ;

COMMENT_START: '@' [cC] [oO] [mM] [mM] [eE] [nN] [tT] [ \t\r\n]* '{' -> pushMode(FIELD_VALUE_CURLY_MODE) ;

NAME : [0-9a-zA-Z!?$&*+./:;^<>_`|[\]\-]+ ;

STRING_LITERAL : '"' ~["]* '"' ;

WS : [ \t\r\n]+ -> skip ;


mode FIELD_VALUE_CURLY_MODE;

FIELD_VALUE_OPEN_CURLY : '{' -> pushMode(FIELD_VALUE_CURLY_MODE) ;
FIELD_VALUE_CLOSE_CURLY : '}' -> popMode ;

FIELD_VALUE_CURLY: ~[{}]+ ;
