class ConsoleInterface
  # Status pictures are located in data/figures
  FIGURES =
      Dir[__dir__ + '/../data/figures/*.txt'].
      sort.
      map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts <<~END
      Word: #{word_to_show}
      #{figure}
      Errors (#{@game.errors_made}): #{errors_to_show}
      Errors left: #{@game.errors_allowed}

    END

    if @game.won?
      puts "U-hooo! You won! Congratulations!"
    elsif @game.lost?
      puts "You lost. We played with the word: #{@game.word}"
    end
  end

  def figure
    return FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__"
        else
          letter
        end
      end

    return result.join(' ')
  end

  def errors_to_show
    return @game.errors.join(', ')
  end

  def get_input
    print "Enter the next letter: "
    letter = gets[0].upcase
    return letter
  end
end
