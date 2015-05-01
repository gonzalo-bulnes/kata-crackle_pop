class CracklePop

  PATTERN_MOTIFS = {
    crackle: Proc.new { |output, number| output.puts 'Crackle' },
    pop: Proc.new { |output, number| output.puts 'Pop' },
    crackle_pop: Proc.new { |output, number| output.puts 'CracklePop' },
    default: Proc.new { |output, number| output.puts number.to_s }
  }

  RANGE_MAX = 100

  def initialize(configuration={ crackle: 3, pop: 5 })
    @pattern = pattern(configuration[:crackle], configuration[:pop])
    @complete_patterns = RANGE_MAX / @pattern.length
    @partial_pattern_length = RANGE_MAX % @pattern.length
  end

  def run(output=STDERR)
    apply_pattern(output, @complete_patterns, @partial_pattern_length)
  end

  private

    def apply_pattern(output, complete_patterns, partial_pattern_length)
      index = 0
      complete_patterns.times do
        @pattern.each do |motif_name|
          index += 1
          PATTERN_MOTIFS[motif_name].call(output, index)
        end
      end
      @pattern.slice(0..partial_pattern_length-1).each do |motif_name|
        index += 1
        PATTERN_MOTIFS[motif_name].call(output, index)
      end
    end

    # There is a deterministic pattern in the Crackle and Pops succession (here with 3 and 5):
    #
    #     1  2 Crackle  4 Pop Crackle  7  8 Crackle Pop 11 Crackle 13 14 CracklePop
    #    16 17 Crackle 19 Pop Crackle 22 23 Crackle Pop 26 Crackle 28 29 CracklePop
    #    31 32 Crackle 34 Pop Crackle 37 38 Crackle Pop 41 Crackle 43 44 CracklePop
    #    and so on...
    #
    def pattern(crackle, pop)
      crackle_pop = crackle * pop # coincidentally crackle_pop is the pattern length
      pattern = (1..crackle_pop).inject([]) { |pattern, number| pattern << motif_name(number, crackle, pop, crackle_pop) }
    end

    def motif_name(number, crackle, pop, crackle_pop)
      if number >= crackle_pop && number % crackle_pop == 0
        :crackle_pop
      elsif number >= pop && number % pop == 0
        :pop
      elsif number >= crackle && number % crackle == 0
        :crackle
      else
        :default
      end
    end
end
