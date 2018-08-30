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
BOOLEAN : 'boolean';
CALLOUT : 'callout';
CLASS : 'class';
ELSE : 'else';
INT : 'int';
RETURN : 'return';
VOID : 'void';
FOR : 'for';
BREAK : 'break';
CONTINUE : 'continue';

CHAR : '\'' (ESC|ASCII) '\'';
BOOLEANLITERAL : (TYPEBOOLEAN);
STRING : '"'(ESC|ASCII|ESPEC)*'"';
INTLITERAL : (NUM)+;
OP : (OPER);
ID : ('_'|CHARAC)(CHARAC|NUM|'_')*;

fragment ESC :  '\\' ('n'|'"'|'\\'|'t'|'r'|'\'');
fragment ASCII : (CHARAC|NUM|ESPEC);
fragment ESPEC : (' '|'!'|'#'..'&'|'('..'/'|':'..'@'|'^'..'`'|'{'..'~'|'['|']');
fragment CHARAC : ('a'..'z'|'A'..'Z');
fragment NUM : ('0'..'9');
fragment OPER : ('+'|'-'|'*'|'<'|'>'|'<='|'>='|'!='|'&&'|'||'|'/'|'='|'==');
fragment TYPEBOOLEAN : ('true'|'false');

WS_ : (' '|'\n'|'\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

VIRGULA : ',';
PONTOVIR:';';
RPARENT : '(';
LPARENT : ')';
