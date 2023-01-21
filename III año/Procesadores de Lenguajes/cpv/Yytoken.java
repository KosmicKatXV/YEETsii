public class Yytoken {
    public final static int A = 0;
    public final static int B = 1;
    public final static int C = 2;
    public final static int D = 3;
    public final static int EOLN = 4;

    private int token;
    private String palabra;

    public Yytoken(int token, String palabra) {
         this.token = token;
         this.palabra = palabra;
    }

    public int getToken()  {
         return token;
    }

    public String getPalabra() {
         return palabra;
    }

    public String toString() {
         return "<"+(char)(65 + (token))+","+palabra+">";
    }
}
