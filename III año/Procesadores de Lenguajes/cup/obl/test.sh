for n in 1 2 31 32 33 41c 42 42c  51 51c 52 52c 71 72 4 5 6 8
do
echo -e "\nTEST $n"
java -cp java-cup-11b-runtime.jar:. Matrices "p$n.mat"
echo -e "\nGOOD $n"
cat "p$n.out"
done