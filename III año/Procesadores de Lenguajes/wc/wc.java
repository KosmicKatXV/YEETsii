import java.io.FileReader;

public class wc{
    static int l = 0;
    static int w = 0;
    static int c = 0;
    public static void main(String[] args) {
        try {
            Yylex yylex = new Yylex(new FileReader(args[0]));
            yylex.yylex();
            System.out.println(l+"  "+w+"   "+c);;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}