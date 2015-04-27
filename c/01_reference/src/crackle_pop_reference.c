#include <crackle_pop_reference.h>

int crackle_pop(void)
{
	int i;
	for (i=1; i<=100; i++) {
		if (i >= 15 && i%15 == 0) {
			printf("CracklePop\n");
		} else if (i >= 5 && i%5 == 0) {
			printf("Pop\n");
		} else if (i >= 3 && i%3 == 0) {
			printf("Crackle\n");
		} else {
			printf("%i\n", i);
		}
	}
	return 0;
}
