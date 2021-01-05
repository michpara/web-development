require 'yaml'

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

def ld(guesses, ind, word, already)
	puts "Would you like to reload your game? (yes/no): "
	ld = gets.chomp

	if ld.downcase == "yes"
		guesses = YAML.load(File.read("guesses.yml"))
		ind = YAML.load(File.read("ind.yml"))
		word = YAML.load(File.read("word.yml"))
		already = YAML.load(File.read("already.yml"))
	end

	return guesses, ind, word, already
end

def save(guesses, ind, word, already)
	puts "Would you like to save the game?: "
	save = gets.chomp
	
	if save.downcase == "yes"
		File.open("guesses.yml", "w") { |file| file.write(guesses.to_yaml)}
		File.open("ind.yml", "w") { |file| file.write(ind.to_yaml)}
		File.open("word.yml", "w") { |file| file.write(word.to_yaml)}
		File.open("already.yml", "w") { |file| file.write(already.to_yaml)}
	end
end

def guess_word(word)
  puts "What is your guess?: " 
  guess = gets.chomp 
  if(guess.downcase == word) #if the user guesses right
    puts "Congratulation! You guessed the right word! The word was " + word + "."
  else #if the user guesses wrong
    puts "Unfortunately, you guessed the wrong word. The word was " + word + "."
  end
  return false, false
end

def guess_letter(already, letters, guesses, ind)
	puts "Which letter would you like to guess?: "
  guess = gets.chomp 
  if already.include? guess #if the user has already guessed this letter
    puts "You have already guessed this letter."
    ourinput = false
    game = true
  elsif !already.include? guess #if the user hasn't guessed this letter
    already << guess #add this letter to the list of guessed letters
	  
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
	    if !guesses.difference(letters).any? #if the user guessed all the letters 
	      puts "Congratulation! You guessed the right word! The word was " + word + "."
	      ourinput = false
	      game = false #end the game
	    else
	     	puts "Congratulations, you guessed a letter right!"
	      ourinput = false
	      game = true
	    end
	  else #if the user guesses a wrong letter
	    puts "Unfortunately, you guessed wrong!"
	    ind +=1 #ind increments by 1
	    ourinput = false
	    game = true
	  end
	end
  return already, guesses, ind, ourinput, game
end

def lose(ind, hangman)
  if ind > 9 #if the user uses up all their guesses
	  puts hangman[10] #print the final hangman state
	  puts "Unfortunately, you made too many wrong guesses. The word was " + word + "."
		return false, false
	end
	return false, true
end

game = true 
ind = 0

hangman = person() 
word = word() 
word = word.delete!("\n").downcase

guesses = []
letters = word.chars #splits the random word into a list and assigns it to "letters"
already = []

(0..letters.length-1).each do |i|
  guesses.append("_") 
end

if (File.file?("guesses.yml") and File.file?("ind.yml") and File.file?("word.yml") and File.file?("already.yml"))
	guesses, ind, word, already = ld(guesses, ind, word, already)
	letters = word.chars
end

puts """Welcome to Hangman! A word will be chosen at random, and you must try to guess it by guessing one letter at a time.
Everytime you guess a letter wrong, an extra body part will be added to the hangman. Once every body part appears on the hangman, you lose the game.
At any point in the game you can choose to guess the entire word, but if you guess it wrong you will automatically lose."""

while game == true
  ourinput = true 
	
	puts hangman[ind] #print the hangman at whichever state
  p guesses
  while ourinput == true
  	save(guesses, ind, word, already)
		
		puts "Would you like to try guessing the entire word?: "
    yesno = gets.chomp 
    
    if yesno.downcase == "yes"
    	ourinput, game = guess_word(word)
    elsif yesno.downcase == "no"
  		already, guesses, ind, ourinput, game = guess_letter(already, letters, guesses, ind)
  		if(game == true)
  			ourinput, game = lose(ind, hangman)
  		end
    elsif yesno != "yes" or yesno != "no" and game == true #if the user doesn't enter yes or no
      puts "Please enter 'yes' or 'no'"
    end
  end
end