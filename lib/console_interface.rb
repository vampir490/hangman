require 'colorize'

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
    END

    left = "Errors left: #{@game.errors_allowed}"

    case @game.errors_allowed
    when 0..2 then puts left.colorize(:red)
    when 3..5 then puts left.colorize(:yellow)
    else puts left.colorize(:green)
    end

    if @game.won?
      puts "U-hooo! You won! Congratulations!".colorize(:light_green)
    elsif @game.lost?
      puts "You lost. We played with the word: #{@game.word}".colorize(:red)
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
