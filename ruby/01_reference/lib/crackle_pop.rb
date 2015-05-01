class CracklePop

  def run(output=STDERR)
    (1..100).each do |number|
      message = if number >= 15 && number % 15 == 0
        'CracklePop'
      elsif number >= 5 && number % 5 == 0
        'Pop'
      elsif number >= 3 && number % 3 == 0
        'Crackle'
      else
        number
      end
      output.puts message
    end
  end
end
