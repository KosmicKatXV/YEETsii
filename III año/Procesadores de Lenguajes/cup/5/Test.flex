import java_cup.runtime.*;
%%   
%cup 
%%      
int		                    { return new Symbol(sym.INT); }
double 		                { return new Symbol(sym.DOUBLE); }
;    		                { return new Symbol(sym.PYC); }
,    		                { return new Symbol(sym.COMA); }
:    		                { return new Symbol(sym.DP); }
[a-zA-Z][a-zA-Z0-9]*		{ return new Symbol(sym.IDENT, yytext() ); }
.|\n						{  }   