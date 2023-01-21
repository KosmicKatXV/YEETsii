%%

%int

%%

[^\n\r\s\t]+   {
    wc.c += yylength();
    wc.w++;
}

\n {wc.l++;
    wc.c++;    
}

[^]     {wc.c++;}