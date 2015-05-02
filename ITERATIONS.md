Iterating on CracklePop
=======================

Here are some note I took while itereating on _CracklePop_. Most of them are fairlay readable, but I often wrote them offline (I mean with a pen on paper), over two weekends and some of them are quite messy. The most interesting sections, in my opinion, are those entitled **Observations**. From there, if something remains unclear, more details may be found in the other sections.

Iterations are ordered from the most recent to the older, I think that it more or less corresponds to sorting them by decreasing interest.

Iteration 6
-----------

Yesterday, I received feedback from [another _kata_][robot] review, which pointed at not taking benefit of the Object-Oriented capabilities of Ruby. This morning I asked myself how that could apply to my CracklePop implementations (which are not very object-oriented, nor idiomatic) and wrote [ruby/04_slower_but_idiomatic](ruby/04_slower_but_idiomatic).

Just to have an idea, I also added the equivalent [ruby/03_reusable_pattern](ruby/03_reusable_pattern) to compare both benchmarks. Making the pattern-based implementation re-usable lead to a much more object-oriented implementation and I find the result much better than the previous ones.

  [robot]: https://github.com/gonzalo-bulnes/kata-toy_robot_simulator

### Code

See [ruby/03_reusable_pattern](ruby/03_reusable_pattern) and [ruby/04_slower_but_idiomatic](ruby/04_slower_but_idiomatic).

### Benchmark results

```bash
time ./ruby/01_reference/bin/benchmark 2>/dev/null

real 0m1.323s
user 0m1.039s
sys  0m0.281s

time ./ruby/03_reusable_pattern/bin/benchmark 2>/dev/null

real 0m1.354s
user 0m1.089s
sys  0m0.263s
```

The speed improvement is not significant on small ranges.


```bash
# 10_000 iterations within a (1..2000) range instead of (1..100)
time ./ruby/03_reusable_pattern/bin/benchmark 2>/dev/null

real 0m26.163s
user 0m20.711s
sys  0m5.440s

time ./ruby/04_slower_but_idiomatic/bin/benchmark 2>/dev/null

real 0m31.936s
user 0m26.445s
sys  0m5.475s
```

But becomes better when ranges get larger (~20% better in the `(1..2000)` range).

### Conclusions

The pattern-based implementation is faster, and gets better when the range to crackle_pop becomes larger.
On the other side, the slower implementation is also much more idiomatic, may be more pleasant to read and use, and is also less hacky (the pattern idea is nice, but very specific to the problem to solve).

Since CracklePop does produce a human-intended output, it's not very likely to be used on very large ranges. Let's prefer the [idiomatic implementation](ruby/04_slower_but_idiomatic). (Even if the [pattern-based implmentation](ruby/03_reusable_pattern) is much cooler!)

Iteration 5 (code)
------------------

Let's see how adequate is Ruby for the task (from a performance point of view).

### Code

See [c/01_reference](c/01_reference).
See also [c/02_print_to_stderr](c/02_print_to_stderr) (an attempt to standardize output to STDERR).

### Results

```bash
# Ruby
time ./ruby/01_reference/bin/benchmark 2>/dev/null

real  0m1.312s
user  0m1.044s
sys 0m0.268s

# C (twice as fast as Ruby)
time ./c/01_reference/bin/benchmark 1>/dev/null

real  0m0.068s
user  0m0.063s
sys 0m0.004s

# Unexpectedly even slower than Ruby!
# (If you know why, please open an issue to explain it to me!)
$ time ./c/02_print_to_stderr/bin/benchmark 2>/dev/null

real 0m0.232s
user 0m0.112s
sys  0m0.120s

```

Iteration 3 (paper and code)
----------------------------

### Observations

- the previous algorithm did not cover properly the beginning of the series (the part before all 'since' statements, where no rule does still apply
- there may be some regularity in the crackle, pop, cracklepop sequences
- confirmed! There is a pattern of period 15. 15 appears to be the divider for the least frequently applied rule, but also more significantly it's the product of the two prime dividers, 3 and 5

### Algorithm

1. define the rules
1. determine the pattern length
1. determine the pattern
1. determine how many times it should be applied completely and which part of it should be applied after that (e.g. 100/15 -> 6|10)
1. loop around the complete patterns and the partial one.

### Code

See [ruby/02_pattern](ruby/02_pattern).

### Afterthoughts

  * it works
  * it could be used to code CracklePops for any couple of prime numbers

Iteration 2 (paper)
-------------------

### Observation

- there should be no need for conditionnals because the sequence of crackles, pops and cracklepops are deterministic and regular

### Algorithm (draft!)

1. set a rule for the less frequent output (x is divisible by 15, output CracklePop)
1. note that rules ordering does matter
1. set its frequency (every 15 outputs, starting with the 15th)

1. set the second least frequently prevailing rule (x is divisible by 5, output Pop)
1. set its frequency (every 5 outputs, starting with the 5th)

1. set the most frequently prevailinf rule (x is divisible by 3)
1. set its frequency (every 3 outputs, starting with the 3rd)

1. create a loop for the first rule, aiming at applying the rule on its last iteration, it should run one time more than there are dividers in the studied range
1. all loops do execute the next rule loop unless it's their last iteration; when it's the last iteration of the loop, reset the index, increase the next rule index (to skip it without interfering with its iterations count) and apply the current rule (that's to say print the corresponding output)
1. create similar loops for each rule

### Code

There is no code for this iteration.

### Afterthoughts

  * each rule must be able to reach the next one (linked list?)
  * there is a settings collection, and two indexes per rule (one, plus three 'number' - int - variables to store dividers counts)

### Do not forget to...

- validating
  * benchmark against modulo-based implementation!
  * write a simple test

Iteration 1 (paper)
-------------------

### Observation

- the most immediate way to code CracklePop seems to be using modulos and conditionals

### Code

See [ruby/01_reference](ruby/01_reference).
