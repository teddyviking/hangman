module Hangman
  class Game
    def initialize(players)
      @players = players
      @current_player, @other_player = players.shuffle
    end

    def play
      puts "Let's play hangman!"
    end

  end
end