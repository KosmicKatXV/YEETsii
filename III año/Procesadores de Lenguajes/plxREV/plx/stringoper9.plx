string min;
string may;
min="aeiou";
int i;
for(i=0;i<min.length;i=i+1) {
   may+=(char)(((int)min[i])-32);
}
min += "-" + may ;
print(may);
print(min);

