def word()
	flag = true
	while(flag)
		line = File.readlines('5desk.txt').sample
		if line.length >= 5 and line.length <= 12
			flag = false
			break
		end
	end
	return line
end

def person()
  hangman = ["""
  -----
  |   |
  |
  |
  |
  |
  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  |
  |
  |
  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  |  -+-
  |
  |
  |
  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-
  |
  |
  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-/
  |
  |
  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-/
  |   |
  |
  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-/
  |   |
  |   |
  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-/
  |   |
  |   |
  |  |
  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-/
  |   |
  |   |
  |  |
  |  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-/
  |   |
  |   |
  |  | |
  |  |
  |
  --------
  """,
  """
  -----
  |   |
  |   0
  | /-+-/
  |   |
  |   |
  |  | |
  |  | |
  |
  --------
  """,
  ]

  return hangman
end

game = true 
index = 0

hangman = person() 
word = word() 
word = word.delete!("\n").downcase

guesses = []
letters = word.chars #splits the random word into a list and assigns it to "letters"
already = []

(0..letters.length-1).each do |i|
  guesses.append("_") 
end

puts """Welcome to Hangman! A word will be chosen at random, and you must try to guess it by guessing one letter at a time.
Everytime you guess a letter wrong, an extra body part will be added to the hangman. Once every body part appears on the hangman, you lose the game.
At any point in the game you can choose to guess the entire word, but if you guess it wrong you will automatically lose."""

while game == true
  ourinput = true 
  puts hangman[index] #print the hangman at whichever state
  p guesses
  while ourinput == true
		puts "Would you like to try guessing the entire word?: "
    yesno = gets.chomp 
    if yesno.downcase == "yes"
    	puts "What is your guess?: " 
        guess = gets.chomp 
        if(guess.downcase == word) #if the user guesses right
          puts "Congratulation! You guessed the right word! The word was " + word + "."
          ourinput = false
          game = false #end the game
        else #if the user guesses wrong
          puts "Unfortunately, you guessed the wrong word. The word was " + word + "."
          ourinput = false
          game = false #end the game
        end
    elsif yesno.downcase == "no"
  		puts "Which letter would you like to guess?: "
      guess = gets.chomp 
      if already.include? guess #if the user has already guessed this letter
        puts "You have already guessed this letter."
        break
      elsif !already.include? guess #if the user hasn't guessed this letter
        already << guess #add this letter to the list of guessed letters
      end
      if letters.include? guess.downcase #if the letter is right
      	indexes = []
      	(0..letters.length-1).each do |i|
      		if letters[i] == guess.downcase
      			indexes << i
      		end
      	end
        (0..indexes.length-1).each do |i| 
          guesses[indexes[i]] = guess.downcase #add this letter to all of the indexes of guesses
        end
        if guesses == letters #if the user guessed all the letters 
          puts "Congratulation! You guessed the right word! The word was " + word + "."
          ourinput = false
          game = false #end the game
        elsif guesses != letters
         	puts "Congratulations, you guessed a letter right!"
          ourinput = false
        end
      else #if the user guesses a wrong letter
        puts "Unfortunately, you guessed wrong!"
        index +=1 #index increments by 1
        ourinput = false
      end
    elsif yesno != "yes" or yesno != "no" and game == true #if the user doesn't enter yes or no
      puts "Please enter 'yes' or 'no'"
    end
    if index > 9 #if the user uses up all their guesses
      puts hangman[10] #print the final hangman state
      puts "Unfortunately, you made too many wrong guesses. The word was " + word + "."
      ourinput = false
      game = false #end the game
    end
  end
end
