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
      puts @guessing_word
    end

    def select_guessing_player
      @guessing_player, @evil_player = @players.shuffle
    end

    def add_guessing_word
      @guessing_word = @evil_player.add_guessing_word
    end

  end
end