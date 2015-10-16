module Hangman
  class Game
    def initialize(players)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

  end
end