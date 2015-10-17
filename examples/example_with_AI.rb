require_relative "../lib/hangman.rb"

puts "Welcome to Hangman"
dictionary = Hangman::Dictionary.new()
dictionary.add_words_from_txt("examples/example_dictionary.txt")

bob = Hangman::Player.new("bob")
computer = Hangman::AIPlayer.new(dictionary.get_words)
players = [bob, computer]

Hangman::Game.new(players).play