clear
for n in e1 e2 g1 g2 h1 h2
do
java -cp java-cup-11b-runtime.jar:. PLC "plc-test/$n.pl" "plc-test/$n.ctd" 
echo -e "ORIGINAL $n"
cat "plc-test/$n.pl"
echo -e "\nRESULT $n"
cat "plc-test/$n.ctd"
echo -e "\nGOODRES $n"
#./plc "plc-test/$n.pl"
echo -e "\nCTD TEST $n"
/ctd "plc-test/$n.ctd"
./plc "plc-test/$n.pl" "plc-test/g$n.ctd"
./ctd "plc-test/g$n.ctd"
sleep 5
clear
done
rm plc-test/*.ctd