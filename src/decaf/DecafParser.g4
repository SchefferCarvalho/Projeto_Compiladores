parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field_decl * method_decl* RCURLY;

iddec: type ID;

field_decl: (type ID (VIRGULA iddec)* 
| type ID LBRACKT int_literal RBRACKT (VIRGULA iddec vect)* ) 
PONTOVIR;

vect: LBRACKT int_literal RBRACKT;

method_decl: (type | VOID) ID LPARENT (iddec (VIRGULA iddec)*)? RPARENT block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type ID (variaveis)* PONTOVIR; 

variaveis: VIRGULA ID;

type: INT|BOOLEAN;

statement: location assign_op expr PONTOVIR
| method_call PONTOVIR
| IF LPARENT expr RPARENT block (ELSE block)?
| FOR ID ATRIBUICAO expr VIRGULA expr block
| return_met PONTOVIR
| BREAK PONTOVIR
| CONTINUE PONTOVIR
| block;

return_met: RETURN expr?;

assign_op: ATRIBUICAO | ATRIBUICAOPLUS | ATRIBUICAOMINUS;

method_call: method_name LPARENT (expr (VIRGULA expr)*)? RPARENT
| CALLOUT LPARENT STRING (VIRGULA callout_agr (VIRGULA callout_agr)*)? RPARENT;

method_name: ID;

location: ID | ID LBRACKT expr RBRACKT;

expr: location | method_call | literal | expr bin_op expr
| MENOS expr | EXCL expr | LPARENT expr RPARENT;

callout_agr: expr | STRING;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: MAIS | MENOS | MULTIPLICA | DIVISAO | MOD;

rel_op: MENOR | MAIOR | MENORIGUAL | MAIORIGUAL; 

eq_op: IGUAL | DIFERENTE;

cond_op: AND | OR;

literal: int_literal | CHAR | BOOLEANLITERAL;

int_literal: INTLITERAL | HEXA;