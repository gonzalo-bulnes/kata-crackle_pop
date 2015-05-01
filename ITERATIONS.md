Iterating on CracklePop
=======================

Here are some note I took while itereating on _CracklePop_. Most of them are fairlay readable, but I often wrote them offline (I mean with a pen on paper), over two weekends and some of them are quite messy. The most interesting sections, in my opinion, are those entitled **Observations**. From there, if something remains unclear, more details may be found in the other sections.

Iterations are ordered from the most recent to the older, I think that it more or less corresponds to sorting them by decreasing interest.

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

See [ruby/02_reference](ruby/02_reference).

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
