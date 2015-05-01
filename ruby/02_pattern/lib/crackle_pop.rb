class CracklePop

  def run(output=STDERR)
    crackle = Proc.new { |output, number| output.puts 'Crackle' }
    pop = Proc.new { |output, number| output.puts 'Pop' }
    crackle_pop = Proc.new { |output, number| output.puts 'CracklePop' }
    default = Proc.new { |output, number| output.puts number.to_s }

    # There is a deterministic pattern in the Crackle and Pops succession:
    #
    #     1  2 Crackle  4 Pop Crackle  7  8 Crackle Pop 11 Crackle 13 14 CracklePop
    #    16 17 Crackle 19 Pop Crackle 22 23 Crackle Pop 26 Crackle 28 29 CracklePop
    #    31 32 Crackle 34 Pop Crackle 37 38 Crackle Pop 41 Crackle 43 44 CracklePop
    #    and so on...
    #
    pattern = [default, default, crackle, default, pop,
               crackle, default, default, crackle, pop,
               default, crackle, default, default, crackle_pop]

    index = 0
    6.times do
      pattern.each do |motif|
        index += 1
        motif.call(output, index)
      end
    end
    pattern.slice(0..9).each do |motif|
      index += 1
      motif.call(output, index)
    end
  end
end
