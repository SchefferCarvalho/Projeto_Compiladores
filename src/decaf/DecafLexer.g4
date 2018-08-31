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
VIRGULA : ',';
PONTOVIR:';';
RPARENT : '(';
LPARENT : ')';
MAIS : '+';
MENOS : '-';
MULTIPLICA : '*'; 
MENOR : '<';
MAIOR : '>';
MENORIGUAL : '<=';
MAIORIGUAL : '>=';
DIFERENTE : '!=';
AND : '&&';
OR : '||';
DIVISAO : '/';
ATRIBUICAO : '=';
IGUAL : '==';
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
HEXA : HEXIND(NUM|'a'..'f'|'A'..'F')+;
ID : ('_'|CHARAC)(CHARAC|NUM|'_')*;

fragment ESC :  '\\' ('n'|'"'|'\\'|'t'|'r'|'\'');
fragment HEXIND : '0x';
fragment ASCII : (CHARAC|NUM|ESPEC);
fragment ESPEC : (' '|'!'|'#'..'&'|'('..'/'|':'..'@'|'^'..'`'|'{'..'~'|'['|']');
fragment CHARAC : ('a'..'z'|'A'..'Z');
fragment NUM : ('0'..'9');
fragment TYPEBOOLEAN : ('true'|'false');

WS_ : (' '|'\n'|'\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;