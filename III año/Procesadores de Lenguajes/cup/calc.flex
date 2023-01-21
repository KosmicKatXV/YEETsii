import java_cup.runtime.*;

%%

%cup

Number = 0|[1-9][0-9]*
LineTerminator = \r|\n|\r\n

%%

/* Expresiones y reglas */
    {Number}           { return   new Symbol(sym.NUMERO, new
Integer(yytext())); }
    "+"                { return   new   Symbol(sym.MAS); }
    "-"                { return   new   Symbol(sym.MENOS); }
    "*"                { return   new   Symbol(sym.POR); }
    "/"                { return   new   Symbol(sym.DIV); }
    "("                { return   new   Symbol(sym.AP); }
    ")"                { return   new   Symbol(sym.CP); }
    {LineTerminator}   { return   new   Symbol(sym.LT); }
    [^]                { }