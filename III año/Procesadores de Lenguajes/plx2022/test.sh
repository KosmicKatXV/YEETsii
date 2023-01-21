clear
for n in  type1 type2 type3 type4 type5 type6
do
java -cp java-cup-11b-runtime.jar:. PLXC "plx/set$n.plx" "plx/set$n.ctd" 
echo -e "ORIGINAL set$n"
cat "plx/set$n.plx"
#echo -e "\nRESULT set$n"
#cat "plx/set$n.ctd"
#echo -e "\nGOODRES set$n"
#./plxc "plx/set$n.plx"
echo -e "\nCTD TEST set$n"
./ctd "plx/set$n.ctd"
./plxc "plx/set$n.plx" "plx/gset$n.ctd"
./ctd "plx/gset$n.ctd"
sleep 2
clear
done
rm plx/*.ctd