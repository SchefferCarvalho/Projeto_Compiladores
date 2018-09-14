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
LBRACKT : '[';
RBRACKT : ']';
VIRGULA : ',';
PONTOVIR:';';
LPARENT : '(';
RPARENT : ')';
MAIS : '+';
MENOS : '-';
EXCL : '!';
MULTIPLICA : '*'; 
MENOR : '<';
MAIOR : '>';
MENORIGUAL : '<=';
MAIORIGUAL : '>=';
DIFERENTE : '!=';
AND : '&&';
OR : '||';
DIVISAO : '/';
MOD: '%';
ATRIBUICAO : '=';
ATRIBUICAOPLUS : '+=';
ATRIBUICAOMINUS : '-=';
IGUAL : '==';
IF : 'if';
BOOLEAN : 'boolean';
CALLOUT : 'callout';
CLASS : 'class';
PROGRAM : 'Program';
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
INTLITERAL : '-'?(NUM)+;
HEXA : HEXIND(NUM|HEXLETRA)(NUM|HEXLETRA)*;
ID : (CHARAC)(CHARAC|NUM)*;

fragment ESC :  '\\' ('n'|'"'|'\\'|'t'|'r'|'\'');
fragment HEXIND : '0x';
fragment ASCII : (CHARAC|NUM|ESPEC);
fragment ESPEC : (' '|'!'|'#'..'&'|'('..'/'|':'..'@'|'^'..'`'|'{'..'~'|'['|']');
fragment CHARAC : ('a'..'z'|'A'..'Z'|'_');
fragment NUM : ('0'..'9');
fragment HEXLETRA : ('a'..'f'|'A'..'F');
fragment TYPEBOOLEAN : ('true'|'false');

WS_ : (' '|'\n'|'\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;