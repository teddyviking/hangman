require_relative "../lib/hangman.rb"

puts "Welcome to Hangman"
bob = Hangman::Player.new("bob")
frank = Hangman::Player.new("frank")
players = [bob, frank]
Hangman::Game.new(players).play

