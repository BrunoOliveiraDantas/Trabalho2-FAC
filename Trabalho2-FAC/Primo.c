#include <stdio.h>

main(){

  int p=0,i = 1,n;

  printf("Introduza um Numero: ");
  scanf("%d",&n);

  while (i<=n) {

    if ((n%i)==0)
     p=p+1;
   
     i=i+1;
  }         

  if (p==2)
    printf("O numero e primo.");

  else
    printf("O numero nao e primo.\n");

  return 0;
}