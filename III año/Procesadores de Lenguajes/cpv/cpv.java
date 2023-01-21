import java.io.FileReader;
import java.io.IOException;

public class cpv {    
    public static void main(String arg[]) {
    int[] contador = {0,0,0,0,0};
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
                Yytoken yytoken = null;
		while (  (yytoken = lex.yylex()) != null  ) {
                    //System.out.println(yytoken);
                    contador[yytoken.getToken()]++;
                }
        for(int i = 0 ; i < 4 ; i++) System.out.println((char)(65+i) + " " + contador[i]);
	    } catch (IOException e) {
	    }
        }
    }
}
