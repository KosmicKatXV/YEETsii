import java.io.FileWriter;

%%

%unicode
%standalone

%state VARIABLE VARIABLE2 REEMPLAZO COMILLAS

%{
    boolean c = false;
    String[] var = new String[2];
    StringBuilder line = new StringBuilder();
    StringBuilder comillas = new StringBuilder();
    private void reset(){
        var[0] = "";
        var[1] = "";
        comillas.delete(0, comillas.length());
    }   
%}

espacio=[;\n\r\s\t]

%%

<YYINITIAL>{
    [_a-zA-Z][_a-zA-Z0-9]*= {
        yybegin(VARIABLE);
        var[0] = yytext().substring(0,yytext().length()-1);
        var[1] = "";
        }
    [_a-zA-Z][_a-zA-Z0-9]*=\" {
        yybegin(VARIABLE2);
        var[0] = yytext().substring(0,yytext().length()-2);
        var[1] = "";
        }
    {espacio}                      {
        System.out.println(line.toString());
    }
    \$                      {
        yybegin(REEMPLAZO);
    }
    \\[^]                   {
        line.append(yytext().substring(1,1));
        yybegin(YYINITIAL);
    }
    \"                      {
        c = true;
        line.append(yytext());
        yybegin(COMILLAS);
    }
    [^]                     {
        line.append(yytext());
    }
}
<VARIABLE>{
    \$[_a-zA-Z][_a-zA-Z0-9]*        {
        comillas.append(TablaSimbolos.get(yytext()));
    }
    [^{espacio}]           {
        comillas.append(yytext());
    }
    \\[^]                   {
        comillas.append(yytext());
        yybegin(VARIABLE);
    }
    {espacio}               {
        var[1] = comillas.toString();
        TablaSimbolos.put(var[0],var[1]);
        reset();
        yybegin(YYINITIAL);
    }
}

<VARIABLE2>{
    \$[_a-zA-Z][_a-zA-Z0-9]*        {
        comillas.append(TablaSimbolos.get(yytext()));
    }
    \\[^]                   {
        comillas.append(yytext());
        yybegin(VARIABLE2);
    }
    [^\"]           {
        comillas.append(yytext());
        
    }
    \"\n              {
        var[1] = comillas.toString();
        TablaSimbolos.put(var[0],var[1]);
        reset();
        yybegin(YYINITIAL);
    }
    [^]               {}
}

<REEMPLAZO>{
    [_a-zA-Z][_a-zA-Z0-9]+           {
        line.append(TablaSimbolos.get("$"+yytext()));
    }
    \n                      {
        yybegin(c ? COMILLAS : YYINITIAL);

    }
    \"                      {
        line.append(yytext());
        yybegin(YYINITIAL);
        c = false;
    }
    [^_a-zA-Z0-9]               {
        line.append(yytext());
        yybegin(c ? COMILLAS : YYINITIAL);
    }

}

<COMILLAS>{
    \$                      {
        yybegin(REEMPLAZO);
    }
    \"                      {
        line.append(yytext());
        yybegin(YYINITIAL);
        c = false;
    }
    [^]                     {
        line.append(yytext());
    }
}