parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS ID LCURLY field_decl* method_decl* RCURLY;

field_decl: (type ID (VIRGULA type ID)* 
| type ID LBRACKT int_literal RBRACKT (VIRGULA type ID LBRACKT int_literal RBRACKT)* ) 
PONTOVIR; 

method_decl: (type | VOID) ID LPARENT (type ID (VIRGULA type ID)*)? RPARENT block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type ID (VIRGULA ID)* PONTOVIR; 

type: INT|BOOLEAN;

statement: location assign_op;

int_literal: ;

