Crackle Pop Kata
================

> Prints out the numbers 1 to 100 (inclusive). If the number is divisible by 3, prints _Crackle_ instead of the number. It it's divisible by 5, prints _Pop_. If it's divisible by both 3 and 5, prints _CracklePop_.

Feel free to add implementations in any language.

Overview
--------

This repository contains several successive implementations of CracklePop which are meant to be independent.

For each of them, see `lib/crackle_pop.rb` (resp. `src/crackle_pop.c`) for the code and `bin/crackle_pop` for an usage example.

```bash
# You can, of course, run CracklePop if you want:
./bin/crackle_pop
```

Each implementation contains also a `bin/benchmark` script, which you can use to run CracklePop 10.000 times at once, and a `README` which contains details about how to perform some basic benchmarking using these scripts.

Last but not least, see the [`ITERATIONS`](ITERATIONS.md) file for comments about the successive iterations.

Available implementations
-------------------------

- **Ruby**
  - A [simple reference implementation](ruby/01_reference) to be able to perform some basic benchmarking.
  - A [pattern-based implementation](ruby/02_pattern) for that specific flavour of CracklePop.
  - A [pattern-based re-usable implementation](ruby/03_reusable_pattern) which can be used to play CracklePop with other numbers than 3 and 5. (Not all numbers fit however, see [`ITERATIONS`](ITERATIONS.md) for details - beware of spoilers!)
  - An [object-oriented reference implementation](ruby/04_slower_but_idiomatic). It is re-usable too, significantly slower for long lists of numbers, but also more idiomatic and easier to fork. (If you ask me, it's not as cool as the previous one, but definitively nice enough.)

- **C**
  - Lastly, a [simple reference implementation](c/01_reference) in C to give some perspective to the Ruby benchmarks.
