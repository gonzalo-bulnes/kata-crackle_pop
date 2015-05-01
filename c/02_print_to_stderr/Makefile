default: crackle_pop benchmark

crackle_pop: src/crackle_pop.c src/crackle_pop_reference.c
	gcc src/crackle_pop.c src/crackle_pop_reference.c -o bin/crackle_pop -Isrc -Wall -pedantic

benchmark: src/benchmark.c src/crackle_pop_reference.c
	gcc src/benchmark.c src/crackle_pop_reference.c -o bin/benchmark -Isrc -Wall -pedantic
