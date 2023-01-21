echo "jflex"
jflex wc.lex
echo "javac"
javac *.java
echo "java"
java wc wc.lex
wc wc.lex
rm *.class
rm Yylex.java