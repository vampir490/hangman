#class manages the interaction with user via console
class ConsoleInterface
  # Status pictures are located in data/figures
  FIGURES =
      Dir[__dir__ + '/../data/figures/*.txt'].
      sort.
      map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  #prints the status of the game: a word with blank unguessed letters, errors, the final status
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

  #chooses the right picture from FIGURES based on the number of errors
  def figure
    FIGURES[@game.errors_made]
  end

  #shows the letter with blank unguessed letters
  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__"
        else
          letter
        end
      end

    result.join(' ')
  end

  #shows errors
  def errors_to_show
    @game.errors.join(', ')
  end

  #gets the next letter to be played
  def get_input
    print "Enter the next letter: "
    letter = gets[0].upcase
  end
end
