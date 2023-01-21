set int c;
set int d;
c = {4,6,8,10};
d = {2,3,4};
int i,j;
while(!(i in c || i in d)) {
   i = i+1;
   j = i;
   while(j*2 in c) {
      print(j*2); 
      j = j*2;
   }
}

