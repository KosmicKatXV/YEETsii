rm Yylex.java
rm sym.java
rm parser.java
rm *.class
clear
echo "CUP"
java -jar cup.jar PLXC.cup
echo "FLEX"
jflex PLXC.flex
echo "JAVAC"
javac -cp java-cup-11b-runtime.jar:. *.java
zip plxc.zip PLXC.flex PLXC.cup *.java