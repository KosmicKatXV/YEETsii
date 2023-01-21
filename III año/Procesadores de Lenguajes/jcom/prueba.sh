echo "jflex JCom.lex"
jflex JCom.lex
echo "javac *.java"
javac *.java
echo "java JCom prueba.java"
java JCom prueba.java
rm *.class
rm Yylex.java