public class Yytoken {

     private int token,size;
     private String[] name = {"//","/*","/**"}; 
     private String text;
     public Yytoken(int token, int size,String text) {
        this.text = text;
        this.token = token;
        this.size = size;
     }

     public int getToken()  {
         return token;
     }

     public int getSize()  {
          return size;
     }

     public String toString() {
         return "<"+name[token]+","+size+","+text+">";
     }
}
