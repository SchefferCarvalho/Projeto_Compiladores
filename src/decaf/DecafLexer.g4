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

ID : ('_'|CHARAC)(CHARAC|INT|'_')*;
CHAR : '\'' (ESC|ASCII) '\'';
STRING : '"' (ESC|ASCII)* '"';
INTLITERAL : '-'?(INT)+;

fragment ESC :  '\\' ('n'|'"'|'\\'|'t'|'r');
fragment ASCII : (CHARAC|INT|ESPEC);
fragment ESPEC : (' '|'!'|'#'..'&'|'('..'/'|':'..'@'|'^'..'`'|'{'..'~'|'['|']');
fragment CHARAC : ('a'..'z'|'A'..'Z');
fragment INT : ('0'..'9');

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
