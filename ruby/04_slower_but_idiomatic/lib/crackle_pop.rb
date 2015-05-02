module CracklePop

  module Actionable
    def crackle_pop!(configuration={ crackle: 3, pop: 5 }, output=STDERR)
      each { |number| output.puts number.to_crackle_pop(configuration) }
    end
  end

  module Aware

    ConfigurationError = Class.new(ArgumentError)

    # Returns a String.
    def to_crackle_pop(configuration)
      raise ConfigurationError unless configuration[:crackle].kind_of?(Fixnum) &&
                                      configuration[:pop].kind_of?(Fixnum)

      return 'CracklePop' if divisible_by?(configuration[:crackle] * configuration[:pop])
      return 'Pop' if divisible_by?(configuration[:pop])
      return 'Crackle' if divisible_by?(configuration[:crackle])
      return self.to_s
    end

    def divisible_by?(number)
      self >= number && self % number == 0
    end
  end
end

Range.include CracklePop::Actionable
Fixnum.include CracklePop::Aware
