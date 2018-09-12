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

field_decl: ( VIRGULA)+ | (); 

method_decl: ;
