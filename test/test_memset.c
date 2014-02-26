#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int	main(int argc, char *argv[])
{
  char tmp[] = "tsmjkfrjsdlkfjpoer";
  int tmpin[15] = {15};
  char	*str;

  memset(0, 0, 0);
  str = strdup(tmp);
  printf("str => %s | ", str);
  memset(str, 'A', sizeof(tmp)  - 1);
  printf("str -> %s\n", str);
  int i;
  for (i = 0; i < 15; i++)
    {
      printf("%d, ", tmpin[i]);
    }
  memset(tmp, 0, 14 * sizeof(int));
  printf("\n");
  for (i = 0; i < 15; i++)
    {
      printf("%d, ", tmpin[i]);
    }
  free(str);
  return 0;
}
