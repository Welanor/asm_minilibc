#include <stdlib.h>
#include <string.h>

int	main(int argc, char *argv[])
{
  char	*str;

  str = strdup("tsmjkfrjsdlkfjpoer");
  memset(str, 'A', strlen(str));
  printf("str => %s | ", str);
  printf("str -> %s\n", str);
  free(str);
  return 0;
}
