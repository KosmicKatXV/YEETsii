clear
for n in 1a 1b
do
echo -e "\nTEST $n"
java -cp java-cup-11b-runtime.jar:. Matrices "xp$n.mat"
echo -e "\nGOOD $n"
cat "xp$n.out"
done