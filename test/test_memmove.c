#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int	main(int argc, char *argv[])
{
  char tmp[] = "tsmjkfrjsdlkfjpoer";
  char tmp2[] = "abcdefghijklmnopqrstiov";
  char	*str;

  memmove(NULL, NULL, 0);
  str = strdup(tmp);
  printf("str => %s | ", tmp2);
  memmove(&tmp2[8], &tmp2[2], 3);
  printf("str -> %s\n", tmp2);
  free(str);
  return 0;
}
