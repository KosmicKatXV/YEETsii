jflex rmv.lex
javac *.java
for NUM in 1 2 3 4 5 6 7 8 9
do
    echo "/////////////////////"
    echo "prueba " $NUM
    java rmv prueba$NUM.sh
    echo "-------------"
    cat prueba$NUM.sh.rmv
done
rm *.class
rm Yylex.java