parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field_decl* method_decl* RCURLY;

field_decl: (type ID (VIRGULA type ID)* 
| type ID LBRACKT int_literal RBRACKT (VIRGULA type ID LBRACKT int_literal RBRACKT)* ) 
PONTOVIR; 

method_decl: (type | VOID) ID LPARENT (type ID (VIRGULA type ID)*)? RPARENT block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type ID (VIRGULA ID)* PONTOVIR; 

type: INT|BOOLEAN;

statement: location assign_op expr PONTOVIR
| method_call PONTOVIR
| IF LPARENT expr RPARENT block (ELSE block)?
| FOR ID ATRIBUICAO expr VIRGULA expr block
| RETURN expr? PONTOVIR
| BREAK PONTOVIR
| CONTINUE PONTOVIR
| block;

assign_op: ATRIBUICAO | ATRIBUICAOPLUS | ATRIBUICAOMINUS;

method_call: method_name LPARENT (expr (VIRGULA expr)*)? RPARENT
| CALLOUT LPARENT string_literal (callout_agr (VIRGULA callout_agr)*)? RPARENT;

method_name: ID;

location: ID | ID LBRACKT expr RBRACKT;

expr: location | method_call | literal | expr bin_op expr
| MENOS expr | EXCL expr | LPARENT expr RPARENT;

callout_agr: expr | string_literal;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: MAIS | MENOS | MULTIPLICA | DIVISAO | MOD;

rel_op: MENOR | MAIOR | MENORIGUAL | MAIORIGUAL; 

eq_op: IGUAL | DIFERENTE;

cond_op: AND | OR;

literal: int_literal | char_literal | bool_literal;

alpha_num: alpha | digit;

alpha: CHARAC;

digit: NUM;

hex_digit: digit | HEXLETRA;

int_literal: decimal_literal | hex_literal;

decimal_literal: INTLITERAL;

hex_literal: HEXA;

bool_literal: BOOLEANLITERAL;

char_literal: CHAR;

string_literal: STRING;