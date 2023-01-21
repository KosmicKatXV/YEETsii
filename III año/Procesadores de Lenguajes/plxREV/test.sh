clear
for n in 1 2 3 4 5 6 7 8 9
do
java -cp java-cup-11b-runtime.jar:. PLXC "plx/charmat$n.plx" "plx/charmat$n.ctd" 
echo -e "ORIGINAL charmat$n"
cat "plx/charmat$n.plx"
#echo -e "\nRESULT charmat$n"
#cat "plx/charmat$n.ctd"
#echo -e "\nGOODRES charmat$n"
#./plxc "plx/charmat$n.plx"
echo -e "\nCTD TEST charmat$n"
./ctd "plx/charmat$n.ctd"
./plxc "plx/charmat$n.plx" "plx/gcharmat$n.ctd"
./ctd "plx/gcharmat$n.ctd"
sleep 2
clear
done
rm plx/*.ctd