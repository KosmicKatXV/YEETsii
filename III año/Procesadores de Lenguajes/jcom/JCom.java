import java.io.*;

public class JCom {
    public static int[] cnt = {0,0,0};
    public static void main(String[] args) {
        String[] name = {"// ","/* ","/**"}; 
        if(args.length > 0){
            try {
                Yylex lex = new Yylex(new FileReader(args[0]));
                int yytoken;
		        lex.yylex();
                for(int i = 0 ; i < 3 ; i++) System.out.println(name[i]+" "+cnt[i]);
             } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
    }
}
