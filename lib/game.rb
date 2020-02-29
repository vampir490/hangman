class Game
  #it is set up the number of errors allowed
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  #returns the array with error letters
  def errors
    @user_guesses - normalized_letters
  end

  #returns number of errors
  def errors_made
    errors.length
  end

  #returns the number of errors lest
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  #returns the array of letters, which are left to guess
  def letters_to_guess
    @letters.map do |letter|
      if @user_guesses.include?(normalize_letter(letter))
        letter
      else
        nil
      end
    end
  end

  #thr next two methods normalize specific russian letters "Ё" and "Й"
  def normalized_letters
    @letters.map {|letter| normalize_letter(letter)}
  end

  def normalize_letter(letter)
    return "Е" if letter == "Ё"
    return "И" if letter == "Й"
    letter
  end

  #the next three methods check whether the game is won, lost or is already over
  #the game is lost if there are no errors left
  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  #the game is won if @user_guesses contains all letters of the initial word
  def won?
    (normalized_letters - @user_guesses).empty?
  end

  #method plays the letter, chosen by user
  #it puts the letter into the array of user guesses
  def play!(letter)
    if !over? && !@user_guesses.include?(letter)
      @user_guesses << normalize_letter(letter)
    end
  end

  #the method merges the letters to the word
  def word
    @letters.join
  end
end
