lexer grammar BibtexLexer;

AT : '@' ;
COMMA : ',' ;
EQUALS : '=' ;

OPEN_CURLY : '{';
CLOSE_CURLY : '}' ;

NAME : [0-9a-zA-Z!?$&*+./:;^<>_`|[\]\-]+ ;

TAG_VALUE : '{' ~[{}]* '}' 
          | '"' ~["]* '"' ;
