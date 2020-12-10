lexer grammar BibtexLexer;

CURLY_VALUE_START : '=' [ \t\r\n]* '{' -> pushMode(CURLY_VALUE_MODE) ;

AT : '@' ;
COMMA : ',' ;
EQUALS : '=' ;
HASH : '#' ;

OPEN_CURLY : '{' ;
CLOSE_CURLY : '}' ;
OPEN_PAREN : '(' ;
CLOSE_PAREN : ')' ;

STRING : [sS] [tT] [rR] [iI] [nN] [gG] ;

fragment COMMENT_START: '@' [cC] [oO] [mM] [mM] [eE] [nN] [tT] [ \t\r\n]* ;
COMMENT_START_CURLY: COMMENT_START '{' -> pushMode(CURLY_VALUE_MODE) ;
COMMENT_START_PAREN: COMMENT_START '(' -> pushMode(PAREN_VALUE_MODE) ;

NAME : [0-9a-zA-Z!?$&*+./:;^<>_`|[\]\-]+ ;

STRING_LITERAL : '"' ~["]* '"' ;

WS : [ \t\r\n]+ -> skip ;


mode CURLY_VALUE_MODE;

CURLY_VALUE_OPEN_CURLY : '{' -> pushMode(CURLY_VALUE_MODE) ;
CURLY_VALUE_CLOSE_CURLY : '}' -> popMode ;

CURLY_VALUE : ~[{}]+ ;


mode PAREN_VALUE_MODE;

PAREN_VALUE_OPEN_PAREN : '(' -> pushMode(PAREN_VALUE_MODE) ;
PAREN_VALUE_CLOSE_PAREN : ')' -> popMode ;

PAREN_VALUE : ~[()]+ ;
