module Hangman
  class Game
    
    def initialize(players, guesses_left=6)
      @players = players
      @guesses_left = guesses_left
      @correct_letters = []
    end

    def play
      set_game
      play_guessing_turn(@guessing_word)
    end


    private

    def set_game
      puts "Let's play hangman!"
      select_guessing_player
      puts "#{@evil_player.name} has been selected to add a word. Please #{@guessing_player.name}, don't look at the screen"
      @guessing_word = add_guessing_word
      puts "#{@guessing_player.name}, here you have the word:"
    end

    def select_guessing_player
      ai_player = @players.find { |player| player.class == AIPlayer }
      if ai_player
        human_player = @players.find { |player| player.class != AIPlayer}
        @evil_player, @guessing_player = ai_player, human_player
      else
        @guessing_player, @evil_player = @players.shuffle
      end
    end

    def add_guessing_word
      @evil_player.add_guessing_word
    end

    def play_guessing_turn(guessing_word)
      display_guessing_word_to_dashes(guessing_word, @correct_letters)
      puts "#{guesses_left} guesses left to die. Be careful man!"
      attempted_letter = make_a_guess
      correct_guess?(guessing_word, attempted_letter ) ? guess_right(attempted_letter) : downsize_guesses
      play_guessing_turn(guessing_word) unless message = game_over_message(guessing_word)
      puts message
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
    
    def game_over_message(guessing_word)
      return "#{@guessing_player.name} won!" if game_over?(guessing_word) == :win
      return "#{@evil_player.name} won!" if game_over?(guessing_word) == :lose
    end

   

    def display_guessing_word_to_dashes(guessing_word, correct_letters)
      guessing_word.each_char do |char| 
        correct_letters.include?(char) ? (print "#{char} ") : (print "_ ")
        puts "\n" if char == guessing_word[-1]
      end
    end

    def correct_guess?(guessing_word, attempted_letter)
      true if guessing_word.include?(attempted_letter)
    end

    def add_correct_letter(letter)
      @correct_letters.push(letter)
    end

    def downsize_guesses
      @guesses_left -= 1
    end

    def win_condition(correct_letters, guessing_word)
      guessing_word.split("").all?{|letter| correct_letters.include?(letter)}
    end

    def lose_condition(guesses_left)
      @guesses_left <= 0
    end

    def game_over?(guessing_word)
      return :win if win_condition(@correct_letters, guessing_word)
       
      return :lose if  lose_condition(@guesses_left)
        
    end
  end
end

#Why don't use instance variables? Because if I change the implementation
#of the variables, the rest of the methods won't change