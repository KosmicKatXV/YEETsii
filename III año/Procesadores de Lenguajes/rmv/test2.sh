jflex rmv.lex
javac *.java
for NUM in 8 9
do
    echo "/////////////////////"
    echo "prueba " $NUM
    java rmv prueba$NUM.sh -debug
    echo "-------------"
    cat prueba$NUM.sh.rmv
done
rm *.class
rm Yylex.java