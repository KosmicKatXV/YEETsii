rm Yylex.java
rm sym.java
rm parser.java
rm *.class
clear
echo "CUP"
java -jar cup.jar Matrices.cup
echo "FLEX"
jflex Matrices.flex
echo "JAVAC"
javac -cp java-cup-11b-runtime.jar:. *.java
