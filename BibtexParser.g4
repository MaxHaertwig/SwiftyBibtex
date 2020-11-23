parser grammar BibtexParser;

options { tokenVocab=BibtexLexer; }

root : bibFile EOF ;
 
bibFile : ( entry )* ;
 
entry : AT entryType=NAME OPEN_CURLY citationKey=NAME COMMA tags CLOSE_CURLY ;
 
tags : tag ( COMMA tag )* ;
 
tag : tagName=NAME EQUALS tagValue=TAG_VALUE ;
