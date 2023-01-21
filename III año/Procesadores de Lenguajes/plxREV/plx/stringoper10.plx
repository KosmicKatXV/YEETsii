string min;
min+="aei";
min+="ou";
string may;
int i;
for(i=0;i<min.length;i=i+1) {
   may+=((char)(((int)min[i])-32))+'-';
   print(may);
}

