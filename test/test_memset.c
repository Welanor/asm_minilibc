#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int	main(int argc, char *argv[])
{
  char tmp[] = "tsmjkfrjsdlkfjpoer";
  char	*str;

  str = strdup(tmp);
  printf("str => %s | ", str);
  memset(str, 'A', sizeof(tmp)  - 1);
  printf("str -> %s\n", str);
  free(str);
  return 0;
}
