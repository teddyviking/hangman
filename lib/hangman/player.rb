module Hangman
  class Player
    attr_reader :name
    def initialize(name)
      @name= name
      
    end

    def add_guessing_word
      word = gets.chomp #need to hide the word!
    end

    def make_a_guess
      guess = gets.chomp
    end

  end

end

#Why should be these two methods here?
#When we extend the class and create the AI player, 
#we will have to redefine those methods, but we don't want
#the class game to be affected 