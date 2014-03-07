#include <string.h>
#include <stdlib.h>
#include <stdio.h>


int main(int argc, char *argv[])
{
  printf("toto => %s\n", strpbrk("toto", "t"));
  printf("toto => %s\n", strpbrk("toto", "o"));
  printf("toto => %s\n", strpbrk("toto", ""));
  printf(" => %s\n", strpbrk("", "sdfsdf"));
  printf("abcdefghijkl => %s\n", strpbrk("abcdefghijkl", "ejc"));
  printf("abcdefghijkl => %s\n", strpbrk("abcdefghijkl", "j"));

  return 0;
}
