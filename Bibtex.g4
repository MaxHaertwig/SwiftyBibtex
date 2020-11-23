grammar Bibtex;

root : bibFile EOF ;
 
bibFile : ( entry )* ;
 
entry : '@' entryType=NAME '{' citationKey=NAME ',' tags '}' ;
 
tags : tag ( ',' tag )* ;
 
tag : tagName=NAME '=' tagValue=TAG_VALUE ;

NAME : [0-9a-zA-Z!?$&*+./:;^<>_`|[\]\-]+ ;

TAG_VALUE : '{' ~[{}]* '}' 
          | '"' ~["]* '"' ;
