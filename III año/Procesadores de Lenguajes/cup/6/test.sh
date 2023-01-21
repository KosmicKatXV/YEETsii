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
echo -e "TEST 1"
java -cp java-cup-11b-runtime.jar:. Test prueba1.txt
echo -e "\nTEST 2"
java -cp java-cup-11b-runtime.jar:. Test prueba2.txt
echo -e "\nTEST 3"
java -cp java-cup-11b-runtime.jar:. Test prueba3.txt
echo -e "\n"