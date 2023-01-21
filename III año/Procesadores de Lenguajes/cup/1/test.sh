rm Yylex.java
rm sym.java
rm parser.java
rm *.class
clear
echo "CUP"
java -jar cup.jar Test.cup
echo "FLEX"
jflex Test.flex
echo "JAVAC"
javac -cp java-cup-11b-runtime.jar:. *.java
echo "TEST"
java -cp java-cup-11b-runtime.jar:. Test prueba1.txt