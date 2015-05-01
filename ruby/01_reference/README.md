See also: [Next implementation >>](../02_pattern)

Crackle Pop (Ruby)
==================

> Prints out the numbers 1 to 100 (inclusive). If the number is divisible by 3, prints _Crackle_ instead of the number. If it's divisible by 5, prints _Pop_. If it's divisible by both 3 and 5, prints _CracklePop_.

Try CracklePop!
---------------

```ruby
# run crackle_pop
./bin/crackle_pop
```

Improve CracklePop
------------------

```ruby
# install the development dependencies
bundle install

# run the full test suite
rspec spec

# benchmark (10.000 iterations)
time ./bin/benchmark 2>/dev/null
```
