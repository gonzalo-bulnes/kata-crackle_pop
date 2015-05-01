#include <crackle_pop_reference.h>

int crackle_pop(void)
{
  int i;
  for (i=1; i<=100; i++) {
    if (i >= 15 && i%15 == 0) {
      fprintf(stderr, "CracklePop\n");
    } else if (i >= 5 && i%5 == 0) {
      fprintf(stderr, "Pop\n");
    } else if (i >= 3 && i%3 == 0) {
      fprintf(stderr, "Crackle\n");
    } else {
      fprintf(stderr, "%i\n", i);
    }
  }
  return 0;
}
