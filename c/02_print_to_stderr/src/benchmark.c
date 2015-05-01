#include <crackle_pop_reference.h>

/* Repeats crackle_pop() to make benchmarks readable. Use with time(1). */
int main(void)
{
	int repetition;
	for (repetition=0; repetition<10000; repetition++) {
		crackle_pop();
	}
	return 0;
}
