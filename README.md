# Hangman

I remember when I was I child and I used to learn languages trying to guess words before I was hanging from a rope... Oh God, how I long for those moments.

Just because I feel nostalgic today,  I think we can make a little tribute to that game. Yes. I'm talking about the hangman!

In case you don't remember the game, I will explain it to you. It requires two players. One of them chooses a word, phrase or sentence and presents a row of dashes, representing each letter of the word, to his competitor. The other player has to guess the phrase by suggesting letters or numbers.

You can't use proper nouns such as names, places, and brands. If the guessing competitor suggests a letter that appears in the phrase, the other player reveals it in all its correct positions. If the suggested letter or number is not present in the word, the other player draws one element of a hanged man stick figure as a tally mark. The game is over when:

* The guessing player completes the word, or guesses the whole phrase correctly
* The other player completes a diagram of the hangman.

Just one little clarification: You will find plenty of different opinions about the number of maximum possible guesses. Some players draw the gallows before the game and draw parts of the man's body (traditionally the head, then the torso, then the arms and legs one by one). Some players begin with no diagram at all and draw the individual elements of the gallows as part of the game, effectively giving the guessing players more chances. The amount of detail on the hanged man can also vary, affecting the number of chances. Some players include a face on the head, either all at once or one feature at a time.

In the game we are building, we will make  **a default total of 6 guesses**. But if you want to, you can implement in the game the choice of how many guesses they want to set. 


## The Basic Game

As always, before we begin to write any code, let's think about classes, actions, responsibilities... So go ahead and re-read the description. Think about the classes you believe we are going to need to build the game. 

Also, think about the actions that belong to those classes. Maybe you'll find that a class that you had in mind is useless. Or the other way around, one class is going to have different and unrelated actions that you should develop as methods of another class.

When you finish, you can compare your guesses with what I think  would be a good starting point (remember that these aren't sacred words, in the end you can follow your instincts and do the exercise as you want).

We are going to need:
* Class `Player` :
  * Holds the name of the player
  * Allows the user to set the word or phrase that will be guessed
  * Creates the guesses by getting the player's choices from keyboard
* Class `Game` : 
  * Holds the players
  * Makes the comparisons between the shots and the target word
  * Reduces the number of opportunities left when the guessing player fails
  * Checks if the game is over after every attempt.
  * Presents all the instructions to the users

Now that we have our action plan, let's create the classes and methods that fulfill this behavior. Remember that each method that you are going to create should do only **one thing**. Take this advice into consideration. If you don't follow it, in the next iterations it would be really difficult to make changes to your classes.

## Forever Alone

But what happens if one day you are coding and, just like me, suddenly you feel the nostalgia overcoming you. You need desperately to play with your Hangman and you cannot find someone to play with... Let's solve this issue changing our program so you don't require another person to choose the word you have to guess!

And how are we going to achieve that? A class Dictionary will to load all the possible words from an external file into our program.

The `Dictionary` class should:
* Load an external dictionary (a list of words) into our program. For example from [this webpage](http://scrapmaker.com/)
* Select a random word between all the words loaded before
* Check if the selected word is valid (has between 5 and 12 letters)

Once you have built your `Dictionary`, you should create a new `AIPlayer` class that inherits from the `Player` class. You should overwrite the initialize method, having as a parameter a dictionary, and setting the name directly. 

Besides, you should also overwrite the method that selects the word. Instead of asking for a keyboard input, it should use the dictionary and call its methods to select the word. 

When our child class from `Player` is developed, we will have to implement it in the `Game` class that we built in the previous step. This might be a hard part, depending on how modular you built your previous code.
 
## Bonus: Save and load the game

If this task has been too easy for you, here is something else for you. Imagine that you are playing against the computer, and your mom calls you for dinner. What are you going to do? 

As a smart programmer, you can build another class to handle a saving and loading functionality. You won't find any advice for this here. Just go ahead and show the Hangman what you are capable of.

## Bonus: Draw the hangman!
Wouldn't be cool if we had our hangman there? If you like challenges, this is for you!