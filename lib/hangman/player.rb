module Hangman
  class Player
    attr_reader :word
    def initialize(name)
      @name= name
      
    end

    def add_guessing_word
      @word = gets.chomp
    end



  end

end