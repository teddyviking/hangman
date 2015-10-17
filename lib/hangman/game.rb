module Hangman
  class Game
    attr_reader :guesses_left
    
    def initialize(players, guesses_left=6)
      @players = players
      @guesses_left = guesses_left
      @correct_letters = []
    end

    def play
      puts "Let's play hangman!"
      select_guessing_player
      puts "#{@evil_player.name} has been selected to add a word. Please #{@guessing_player.name}, don't look at the screen"
      guessing_word = add_guessing_word
      puts "#{@guessing_player.name}, here you have the word"
      display_guessing_word_to_dashes(guessing_word)
      puts "#{guesses_left} guesses left to die. Be careful man!"
      attempted_letter = make_a_guess
      correct_guess?(guessing_word, attempted_letter ) ? guess_right(attempted_letter) : downsize_guesses
    end

    def select_guessing_player
      @guessing_player, @evil_player = @players.shuffle
    end

    def add_guessing_word
      @evil_player.add_guessing_word
    end

    def display_guessing_word_to_dashes(guessing_word)
      guessing_word.each_char { |char| print "_ " }
    end

    def make_a_guess
      @guessing_player.make_a_guess
    end
    
    def guess_right(correct_letter)
      puts "That was a correct answer, good work!"
      add_correct_letter(correct_letter)
    end

    def guess_wrong
      puts "Ups! Try again man!"
      downsize_guesses
      puts "You only have #{@guesses} left"
    end

   

    private

    def correct_guess?(guessing_word, attempted_letter)
      true if guessing_word.include?(attempted_letter)
    end

    def add_correct_letter(letter)
      @correct_letters.push(letter)
    end

    def downsize_guesses
      @guesses_left -= 1
    end


  end
end