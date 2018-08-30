lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';
LCHAVE : '[';
RCHAVE : ']';
IF : 'if';

ID : ('_'|'a'..'z'|'A'..'Z')(CHARALFNUM|'_')*;
CHAR : '\'' (ESC|ASCII) '\'';
STRING : '"' (ESC|ASCII)* '"';

fragment ESC :  '\\' ('n'|'"'|'\\'|'t'|'r');
fragment ASCII : (CHARALFNUM|ESPEC);
fragment ESPEC : ('!'|'#'..'&'|'('..'/'|':'..'@'|'^'..'`'|'{'..'~'|'['|']');
fragment CHARALFNUM : ('a'..'z'|'A'..'Z'|'0'..'9');

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
