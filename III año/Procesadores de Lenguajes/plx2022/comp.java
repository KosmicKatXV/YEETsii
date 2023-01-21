import java.util.*;

public class comp {
    
    static List<Tag>    ifTag = new ArrayList<>();
    static List<String> doTag = new ArrayList<>();
    static List<Tag>    forTag = new ArrayList<>();
    static List<Tag>    iteTag = new ArrayList<>();
    static List<String> iteVar = new ArrayList<>();
    static List<String> whileTag = new ArrayList<>();
    static Map<String,Integer> typeof = new HashMap<>();

    static int tag_ctr = 0;
    static int var_ctr = 0;

    public static String getVar(){
        return "$t"+var_ctr++;
    }
    public static String getTag(){
        return "L"+tag_ctr++;
    }

    private static String getLen(String id){
        return "$"+id+"_length";
    }

    private static void setLen(String id,String length){
        asig("$"+id+"_length", length);
    }

    private static boolean isArray(String id){
        return typeof.containsKey(id) && (typeof.get(id) > 2);
    }
    public static void print(String expr){
        if(!isArray(expr))   {
            if(typeof.containsKey(expr) && typeof.get(expr) == 1)   System.out.println("    printc "+expr+";");
            else                                                    System.out.println("    print "+expr+";");
        }
        else{
            String tmp2 = ite_start(expr);
                if(typeof.get(expr) == 4)   System.out.println("    writec "+tmp2+";");
                else                        System.out.println("    write "+tmp2+";");
                System.out.println("    writec 32;");
            ite_end();
            System.out.println("    writec 10;");
            }
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
        ifTag.add(t);
    }

    public static void do_start(){
        comm("do_start INIT");
        String lx = getTag();
        doTag.add(lx);
        labelIt(lx);
        comm("do_start END");
    }

    public static void do_end(Tag c){
        comm("do_end INIT");
        labelIt(c.getV());
        System.out.println("    "+gotoL(doTag.remove(doTag.size()-1)));
        labelIt(c.getF());
        comm("do_end END");
    }

    public static void for_start(){
        comm("for_start INIT");
        Tag t = new Tag(getTag(),getTag(),getTag());
        forTag.add(t);
        labelIt(t.getV());
        comm("for_start END");
    }

    public static void for_mid1(){
        comm("for_mid1 INIT");
        Tag t = forTag.get(forTag.size()-1);
        labelIt(t.getF());
        comm("for_mid1 END");
    }

    public static void for_mid2(Tag c){
        comm("for_mid2 INIT");
        Tag t = forTag.get(forTag.size()-1);
        System.out.println("    "+gotoL(t.getV()));
        labelIt(c.getV());
        comm("for_mid2 END");
    }

    public static void for_end(Tag c){
        comm("for_end INIT");
        Tag t = forTag.remove(forTag.size()-1);
        System.out.println("    "+gotoL(t.getF()));
        labelIt(c.getF());
        comm("for_end END");
    }

    public static void if_end(Boolean e){
        Tag t = ifTag.remove(ifTag.size()-1);
        labelIt(e ? t.getE() : t.getF());
    }

    public static void if_else(){
        Tag t = ifTag.get(ifTag.size()-1);
        System.out.println("    "+gotoL(t.getE()));
        labelIt(t.getF());
    }

    public static void while_start(){
        String t = getTag();
        whileTag.add(t);
        labelIt(t);
    }

    public static void while_end(Tag c){
        System.out.println("    "+gotoL(whileTag.remove(whileTag.size()-1)));
        labelIt(c.getF());
    }

    public static String asig(String id, String e){
        chk(id, e, true);
        System.out.println("    "+id+" = "+e+";");
        if(isArray(id) && isArray(e))   asig(getLen(id), getLen(e));
        return id;
    }

    public static String asig(String id, String[] e){
        for(int i = 0; i < e.length ; i++){
            if(typeof.get(id)%3 != 2 && e[i].contains("."))   error();
            System.out.println("    "+id+"["+i+"] = "+e[i]+";");
        }
        setLen(id, String.valueOf(e.length));
        return id;
    }

    public static String ite_start(String id){
        comm("ite_start "+id+" Start");
        String l = getLen(id);
        String i  = getVar();
        comp.while_start();
        Tag c = if_start(i, l, 4);
        comp.labelIt(c.getV());
        iteTag.add(c);
        iteVar.add(i);
        comm("ite_start "+id+" END");
        return asig(getVar(), id+"["+i+"]");
    }

    public static void ite_end(){
        String i = iteVar.remove(iteVar.size()-1);
        System.out.println("    #ite_end for: "+i);
        System.out.println("    "+i+" = "+i+" + 1;");
        comp.while_end(iteTag.remove(iteTag.size()-1));
        asig(i, "0");
        comm("ite_end END");
    }

    public static String add(String id, String e){
        if(isArray(e))    addArr(id,e);
        else{
        //se comprueba que el elemento no esta en el array
        String it  = ite_start(id);
            Tag d = if_start(it,e,0);
            labelIt(d.getV());
            String j = asig(getVar(), "1");
            labelIt(d.getF());
        ite_end();
        Tag t =  if_start(j, "0", 0);
        //se mete el elemento
        labelIt(t.getV());
        String len = getLen(id);
        System.out.println("    "+id+"["+len+"] = "+e+";");
        setLen(id, op(len, "1", 0));
        labelIt(t.getF());
        asig(j, "0");
        }
        return id;
    }

    private static void addArr(String id, String e) {
        String it = ite_start(e);
            add(id,it);
        ite_end();
    }

    public static String add(String id, String[] e){
        int len2 = e.length;
        for(int i = 0; i < len2 ; i++)    add(id,e[i]);
        return id;
    }

    public static String del(String id, String e){
        if(isArray(e))    delArr(id,e);
        else{
        //se comprueba que el elemento no esta en el array
        String j  = getVar();
        String it = ite_start(id);
            String i = iteVar.get(iteVar.size()-1);
            Tag d = if_start(it,e,0);
            labelIt(d.getV());
                asig(j,"1");
            labelIt(d.getF());
            Tag g = if_start(j, "1", 0);
            labelIt(g.getV());
                asig(id+"["+i+"]",asig(getVar(), id+"["+op(i, "1", 0)+"]"));
            labelIt(g.getF());
        ite_end();
        Tag f = if_start(j, "1", 0);
        labelIt(f.getV());
            String len = getLen(id);
            setLen(id, op(len, "1", 1));
        labelIt(f.getF());
        asig(j, "0");
        }
        return id;
    }



    private static void delArr(String id, String e) {
        String it = ite_start(e);
            del(id,it);
        ite_end();
    }

    public static String del(String id, String[] e){
        int len2 = e.length;
        for(int i = 0; i < len2 ; i++)    del(id,e[i]);
        return id;
    }

    public static void set(String[] id,int type){
       for(String i : id)   typeof.put(i, type);
       //comm(id+" "+type);
       
    }

    public static String gotoL(String l){
        return "goto "+l+";";
    }
    public static void labelIt(String l){
        System.out.println(l+":");
    }

    public static void chk(String e1, String e2,boolean arrayChk){
        if(typeof.containsKey(e1) && typeof.containsKey(e2)){
            if(arrayChk) {
                if(typeof.get(e1) != typeof.get(e2))        error();
            }else{
                if(typeof.get(e1)%3 != typeof.get(e2)%3)    error();
            }
        }
    }
    private static void error() {
        comm("ERROR: Error de tipos");
        System.out.println("    error;");
        System.out.println("    halt;");
    }

    private static void comm(String comment) {
        System.out.println("    #"+comment);
    }
}
