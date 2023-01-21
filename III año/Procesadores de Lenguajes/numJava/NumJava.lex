%%

espacio = [\s\n\r\t]
numero = [0-9]
l = [lL]
c = [cC]
d = [dD]

%%

<YYINITIAL>{

^[^{numero}\.].*                {return new Yytoken(261,yytext());}
{numero}*[^{l}{c}{d}]$                 {return new Yytoken(261,yytext());}
{numero}*                       {return new Yytoken(257,yytext());}
[^]                         {}
}