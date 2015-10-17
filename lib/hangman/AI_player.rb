module Hangman
  class AIPlayer < Player

    def initialize(possible_words) #expecting an array
      @possible_words = possible_words
      @name = "Hanging HAL"
    end
    
    def add_guessing_word
      @possible_words.sample
    end
  end

end

#I've choose not to use the dictionary keyword because I'd rather depend in the Array class
#than a random class that I can change whenever I feel like to.