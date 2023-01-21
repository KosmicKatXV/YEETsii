/*
Palabras que tienen al menos dos vocales seguidas, y terminan en vocal. -> A
Palabras que NO tienen dos vocales seguidas, y terminan en vocal -> B
Palabras que tienen al menos dos vocales seguidas, y terminan en consonante -> C
Palabras que NO tienen dos vocales seguidas, y terminan en consonante -> D
*/

%%

%unicode

Vocales = [aeiouAEIOU]
Consonantes=[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]
Letra = [a-zA-Z]
Separador=[^a-zA-Z]
%%


{Letra}*{Vocales}{2}{Letra}*{Vocales} ?/{Separador}               { 
                return new Yytoken(Yytoken.A, yytext());
           }


({Vocales}+{Consonantes})*{Vocales}   /{Separador}  { 
                return new Yytoken(Yytoken.B, yytext());
           }


{Letra}*{Vocales}{Vocales}{Letra}*{Consonantes} /{Separador}      { 
                return new Yytoken(Yytoken.C, yytext());
           }

({Vocales}|({Consonantes}{Vocales})+)*{Consonantes} /{Separador}      { 
                return new Yytoken(Yytoken.D, yytext());
           }
 
.|\r|\n          {}
