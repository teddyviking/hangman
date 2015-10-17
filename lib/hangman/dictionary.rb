module Hangman
  class Dictionary
    
    def initialize
     @words_list = []
    end

    def add_words_from_txt(file_name)
      new_words = IO.readlines(file_name)
      new_words.each {|word| @words_list << word.chomp}
    end

    def get_words
      binding.pry
      @words_list
    end
  end
end