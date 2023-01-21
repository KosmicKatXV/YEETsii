import java_cup.runtime.*;

%%
%cup

%%
\{                                                    { return new Symbol(sym.ALL); }
\}                                                    { return new Symbol(sym.CLL); }
\(                                                    { return new Symbol(sym.AP); }
\)                                                    { return new Symbol(sym.CP); }
\;                                                    { return new Symbol(sym.PYC); }

\=                                                      { return new Symbol(sym.ASIG); }
\+                                                      { return new Symbol(sym.MAS); }
\-                                                      { return new Symbol(sym.MENOS); }
\*                                                      { return new Symbol(sym.POR); }
\/                                                      { return new Symbol(sym.DIV); }

\=\=                                                    { return new Symbol(sym.LEQ); }
\!\=                                                    { return new Symbol(sym.LNEQ); }
\>                                                      { return new Symbol(sym.LMA); }
\>\=                                                    { return new Symbol(sym.LMAQ); }
\<                                                      { return new Symbol(sym.LME); }
\<\=                                                    { return new Symbol(sym.LMEQ); }
\!                                                      { return new Symbol(sym.LNE); }
\&\&                                                    { return new Symbol(sym.LAND); }
\|\|                                                    { return new Symbol(sym.LOR); }

if                                                      { return new Symbol(sym.IF); }
else                                                    { return new Symbol(sym.ELSE); }
while                                                   { return new Symbol(sym.WHILE); }
do                                                      { return new Symbol(sym.DO); }
for                                                     { return new Symbol(sym.FOR); }
print                                                   { return new Symbol(sym.PRINT); }

[a-zA-Z][a-zA-Z0-9]*                                  { return new Symbol(sym.IDENT, yytext() ); }
(0|[1-9][0-9]*)                                       |
(([0-9]*\.[0-9]+|[0-9]+\.[0-9]*)([eE][+-]?[0-9]+)?)   |
([0-9]*)([eE][+-]?[0-9]+)                             { return new Symbol(sym.NUMERO, yytext()); }
\/\/.*											      {  }
\r|\n                                                 {  }
\ |\t|\f                                              {  }
[^]                                                   { throw new Error("Illegal character <"+yytext()+">"); }

