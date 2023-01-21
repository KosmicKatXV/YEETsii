%%

%state COM0
%state COM1
%state COM2
%unicode
%int
nohdp = [^\n\s\t\r]
%%

<YYINITIAL>{
    \".*\"      {}
    (\/\/)      {yybegin(COM0);}  
    (\/\*)      {yybegin(COM1);} 
    (\/\*{2})   {yybegin(COM2);}
    [^]         {}
}

<COM0>{
    {nohdp}   {(JCom.cnt[0])++;}
    \n          {yybegin(YYINITIAL);}
    [^] {}
}

<COM1>{
    (\*\/)      {yybegin(YYINITIAL);}
    {nohdp}   {(JCom.cnt[1])++;}
    [^]        {}
 }

<COM2>{
    (\*\/)      {yybegin(YYINITIAL);}
    {nohdp}   {(JCom.cnt[2])++;}
    [^]         {}
}
