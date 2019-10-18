# Hangman, ver. 1.3

require_relative 'lib/console_interface'
require_relative 'lib/game'

# A code to make it work properly on Windows with Russian
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Hello everyone!"

# Getting a random word from the file
word = File.readlines(__dir__ + '/data/words.txt', encoding: 'UTF-8', chomp: true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

# Checking if the game is over
until game.over?
  # Showing current game status
  console_interface.print_out
  # Asking for the next letter
  letter = console_interface.get_input
  # Updating the game status
  game.play!(letter)
end

# Showing the final status of the game
console_interface.print_out
