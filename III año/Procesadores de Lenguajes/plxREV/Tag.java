public class Tag {
    private String v,f,e;

    public Tag(String v, String f, String e) {
        this.v = v;
        this.f = f;
        this.e = e;
    }

    public String getV() {
        return v;
    }

    public String getF() {
        return f;
    }
    
    public String getE(){
        return e;
    }

    public Tag invert(){
        String t = e;
        e = v;
        v = f;
        f = e;
        e = t;
        return this;
    }
}
