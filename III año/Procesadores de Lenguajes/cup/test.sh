clear
echo "CUP"
java -jar cup.jar calc.cup
echo "FLEX"
jflex calc.flex
echo "JAVAC"
javac java-cup-11b-runtime.jar *.java
echo "TEST"
java Calculadora ./ejemplo zp1a.mat