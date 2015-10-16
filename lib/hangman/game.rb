module Hangman
  class Game
    def initialize(players)
      @players = players

    end

    def play
      puts "Let's play hangman!"
      select_guessing_player
      puts "#{@evil_player.name} has been selected to add a word. Please #{@guessing_player.name}, don't look at the screen"
      add_guessing_word
      puts "#{@guessing_player.name}, here you have the word"
      display_guessing_word_to_dashes
    end

    def select_guessing_player
      @guessing_player, @evil_player = @players.shuffle
    end

    def add_guessing_word
      @guessing_word = @evil_player.add_guessing_word
    end

    def display_guessing_word_to_dashes
      @guessing_word.each_char { |char| print "_ " }
    end

  end
end