lexer grammar BibtexLexer;

TAG_VALUE_CURLY_START : '=' [ \t\r\n]* '{' -> pushMode(TAG_VALUE_CURLY_MODE) ;
TAG_VALUE_QUOTE_START : '=' [ \t\r\n]* '"' -> pushMode(TAG_VALUE_QUOTE_MODE) ;

AT : '@' ;
COMMA : ',' ;

OPEN_CURLY : '{';
CLOSE_CURLY : '}' ;

NAME : [0-9a-zA-Z!?$&*+./:;^<>_`|[\]\-]+ ;

WHITESPACE : [ \t\r\n]+ -> skip ;

mode TAG_VALUE_CURLY_MODE;

TAG_VALUE_OPEN_CURLY : '{' -> pushMode(TAG_VALUE_CURLY_MODE) ;
TAG_VALUE_CLOSE_CURLY : '}' -> popMode ;

TAG_VALUE_CURLY: ~[{}]+ ;

mode TAG_VALUE_QUOTE_MODE;

TAG_VALUE_CLOSE_QUOTE : '"' -> popMode ;

TAG_VALUE_QUOTE: ~["]+;
