%%

Variable = [a-zA-Z_][a-zA-Z0-9_]*
Comando = [a-zA-Z][a-zA-Z0-9_]*

%{
       String variable, valor;
%}

%int

%xstate VARIABLE TEXTO ARGUMENTOS

%%

<YYINITIAL> {

       {Comando}" "                 {System.out.print(yytext());
                                    yybegin(ARGUMENTOS);}

       {Variable}\=                {variable = yytext().substring(0, yytext().length()-1);
                                    valor = "";
                                    yybegin(VARIABLE);}

       [\s\n]                      {}

}

<VARIABLE> {

       \${Variable}                               {valor += TablaSimbolos.get(yytext());}

       \"                                         {yybegin(TEXTO);}

       [^\n\s;]                                 {valor += yytext();}

       [\n;]                         {TablaSimbolos.put(variable, valor);
                             yybegin(YYINITIAL);}

}

<TEXTO> {

       \${Variable}                     {valor += TablaSimbolos.get(yytext());}

       [^\"]                              {valor += yytext();}

       \"                         {yybegin(VARIABLE);}

}

<ARGUMENTOS> {


       \${Variable}               {System.out.print(TablaSimbolos.get(yytext()));}

       [^\n$]                {System.out.print(yytext());}

       \n                          {yybegin(YYINITIAL);}



}
