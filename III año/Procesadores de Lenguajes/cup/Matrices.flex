import java_cup.runtime.*;

%%

%cup

%%
\{                                                    { return new Symbol(sym.ALL); }
\}                                                    { return new Symbol(sym.CLL); }
\(                                                    { return new Symbol(sym.AP); }
\)                                                    { return new Symbol(sym.CP); }
\[                                                    { return new Symbol(sym.AC); }
\]                                                    { return new Symbol(sym.CC); }
\,                                                    { return new Symbol(sym.COMA); }
\;                                                    { return new Symbol(sym.PYC); }
\=                                                    { return new Symbol(sym.ASIG); }
\+                                                    { return new Symbol(sym.MAS); }
\-                                                    { return new Symbol(sym.MENOS); }
\*                                                    { return new Symbol(sym.POR); }
\/                                                    { return new Symbol(sym.DIV); }
\:                                                    { return new Symbol(sym.CONCATENA); }
\&                                                    { return new Symbol(sym.INTERSECCION); }
set                                                   { return new Symbol(sym.SET, yytext() ); }
inversa                                               { return new Symbol(sym.INVERSA, yytext() ); }
transpuesta                                           { return new Symbol(sym.TRANSPUESTA, yytext() ); }
adjunta                                               { return new Symbol(sym.ADJUNTA, yytext() ); }
print                                                 { return new Symbol(sym.PRINT, yytext() ); }
[a-zA-Z][a-zA-Z0-9]*                                  {
                                                        String st = yytext();
                                                        if (TablaSimbolos.buscar(st)!=null) {
                                                           if (Matrices.DEBUG) System.out.println("MATRIZ:"+st);
                                                           // Devuelve el objeto matriz, no el identificador.
                                                           return new Symbol(sym.MATRIZ, TablaSimbolos.buscar(st));
                                                        } else if (TablaSimbolos.buscarVector(st)!=null) {
                                                           if (Matrices.DEBUG) System.out.println("VECTOR:"+st);
                                                           // Devuelve el objeto vector, no el identificador.
                                                           return new Symbol(sym.VECTOR, TablaSimbolos.buscarVector(st));
                                                        } else if (TablaSimbolos.buscarConjunto(st)!=null) {
                                                           if (Matrices.DEBUG) System.out.println("CONJUNTO:"+st);
                                                           // Devuelve el objeto conjunto, no el identificador.
                                                           return new Symbol(sym.CONJUNTO, TablaSimbolos.buscarConjunto(st));
                                                        } else {
                                                           if (Matrices.DEBUG) System.out.println("IDENT:"+st);
                                                           // Devuelve el identifivador, como cadena de caracteres.
                                                           return new Symbol(sym.IDENT, st);
                                                        }
                                                      }
(0|[1-9][0-9]*)                                       |
(([0-9]*\.[0-9]+|[0-9]+\.[0-9]*)([eE][+-]?[0-9]+)?)   |
([0-9]*)([eE][+-]?[0-9]+)                             { return new Symbol(sym.NUMERO, new Double(yytext()) ); }
\/\/.*											      {  }
\r|\n                                                 {  }
\ |\t|\f                                              {  }
[^]                                                   { throw new Error("Illegal character <"+yytext()+">"); }

