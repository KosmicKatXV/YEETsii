set int c;
set int d;
c = {1,2,3};
d = {2,3,4};
int i;
for(i=1;i<5;i++) {
   if (i in c && i in d) {
      print(i);
   }
}

