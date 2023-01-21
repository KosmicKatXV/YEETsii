import java.util.*;

public class comp {
    
    static List<Tag> iftag = new ArrayList<>();
    static List<String> dotag = new ArrayList<>();
    static List<Tag> fortag = new ArrayList<>();
    static int tag_ctr = 0;
    static int var_ctr = 0;

    public static String getVar(){
        return "$t"+var_ctr++;
    }
    public static String getTag(){
        return "L"+tag_ctr++;
    }
    public static void print(String expr){
        System.out.println("    print "+expr+";");
    }
    public static String op(String e1, String e2, int op) {
        String  aux = getVar();
        String  ops = "";
        switch(op){
            case 0:
                ops ="+";
                break;
            case 1:
                ops ="-";
                break;
            case 2:
                ops ="*";
                break;
            case 3:
                ops ="/";
                break;
        }
        System.out.println("    "+aux+" = "+e1+ops+e2+";");
        return aux;
    }

    public static Tag lop(Tag e1, Tag e2, Boolean op) {
        //or
        if(op){
            labelIt(e1.getV());
            System.out.println("    "+gotoL(e2.getF()));
        //and
        }else{
            labelIt(e1.getF());
            System.out.println("    "+gotoL(e2.getV()));
        }
        return e2;
    }

    public static Tag if_start(String e1, String e2, int op) {
        String  ops = "";
        boolean c = false;
        String  e3;
        switch(op){
            //LEQ
            case 0:
                ops ="==";
                break;
            //LNE
            case 1:
                ops ="!=";
                break;
            //LMA
            case 2:
                ops ="<";
                e3 = e2;
                e2 = e1;
                e1 = e3;
                break;
            //LMAEQ
            case 3:
                ops ="<";
                e3 = e2;
                e2 = e1;
                e1 = e3;
                c  = true;
                break;
            //LME
            case 4:
                ops ="<";
                break;
            //LMEQ
            case 5:
                ops ="<";
                c  = true;
                break;
            case 6:
                ops ="!";
                break;
            case 7:
                ops ="and";
                break;
            case 8:
                ops ="or";
                break;
            case 9:
                ops ="";
                c  = true;
                break;
        }
        Tag t = new Tag(getTag(),getTag(),getTag());
        String v = c ? t.getF() : t.getV();
        String f = c ? t.getV() : t.getF();
        System.out.println("    if ("+e1+" "+ops+" "+e2+") "+gotoL(v));
        System.out.println("    "+gotoL(f));
        return t;
    }

    public static void addTag(Tag t){
        iftag.add(t);
    }

    public static void do_start(){
        String lx = getTag();
        dotag.add(lx);
        labelIt(lx);
    }

    public static void do_end(Tag c){
        labelIt(c.getV());
        System.out.println("    "+gotoL(dotag.remove(dotag.size()-1)));
        labelIt(c.getF());
    }

    public static void for_start(){
        Tag t = new Tag(getTag(),getTag(),getTag());
        fortag.add(t);
        labelIt(t.getV());
    }

    public static void for_mid1(){
        Tag t = fortag.get(fortag.size()-1);
        labelIt(t.getF());
    }

    public static void for_mid2(Tag c){
        Tag t = fortag.get(fortag.size()-1);
        System.out.println("    "+gotoL(t.getV()));
        labelIt(c.getV());
    }

    public static void for_end(Tag c){
        Tag t = fortag.remove(fortag.size()-1);
        System.out.println("    "+gotoL(t.getF()));
        labelIt(c.getF());
    }

    public static void if_end(Boolean e){
        Tag t = iftag.remove(iftag.size()-1);
        labelIt(e ? t.getE() : t.getF());
    }

    public static void if_else(){
        Tag t = iftag.get(iftag.size()-1);
        System.out.println("    "+gotoL(t.getE()));
        labelIt(t.getF());
    }

    public static String asig(String id, String e){
        System.out.println("    "+id+" = "+e+";");
        return id;
    }

    public static String gotoL(String l){
        return "goto "+l+";";
    }
    public static void labelIt(String l){
        System.out.println(l+":");
    }
}
