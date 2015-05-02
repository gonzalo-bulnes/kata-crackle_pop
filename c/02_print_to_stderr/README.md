See also: [<< Previous implementation](../01_reference), [Next implementation >>](../../ruby/03_reusable_pattern)

Crackle Pop (another ANSI C reference implementation)
=====================================================

> Prints out the numbers 1 to 100 (inclusive). If the number is divisible by 3, prints _Crackle_ instead of the number. If it's divisible by 5, prints _Pop_. If it's divisible by both 3 and 5, prints _CracklePop_.

This implmentation was an attempt to print to `STDERR` instead of `STDOUT`, yet is **very slow** (see [`ITERATIONS`](../../ITERATIONS.md) for benchmarks).

Try CracklePop!
---------------

```ruby
# run crackle_pop
./bin/crackle_pop
```

Improve CracklePop
------------------

```ruby
# compile crackle_pop
make

# there is no test suite :S

# benchmark (10.000 iterations)
time ./bin/benchmark 2>/dev/null
```
