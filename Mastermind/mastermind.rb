COLOURS = ['Y', 'B', 'P', 'G', 'O', 'R']

def check_code(code)
	return (code.length < 4 or code.length > 4 or !(code - COLOURS).empty?)
end

def count_colour_and_place(temp_code, guess, right_colour_and_place, flag)
	if flag == false
		(0..3).each do |i|
			if temp_code[i] == guess[i] 
				right_colour_and_place += 1
				temp_code[i] = 0
	    end
	  end
	  return right_colour_and_place, temp_code
	else
		right_colours_and_place = []
		(0..3).each do |i|
			if temp_code[i] == guess[i] 
				right_colour_and_place += 1
				right_colours_and_place[i] = guess[i]
				temp_code[i] = 0
			else
				right_colours_and_place[i] = 0
	    end
	  end
	  return right_colour_and_place, temp_code, right_colours_and_place
	end
end

def count_colour(temp_code, guess, right_colour, flag)
  if flag == false
	  (0..3).each do |i|
			if guess.include? temp_code[i] 
				right_colour += 1
				temp_code[i] = 0
		  end
	  end
	  return right_colour, temp_code
	else
		right_colours = []
		(0..3).each do |i|
			if guess.include? temp_code[i] 
				right_colour += 1
				right_colours << temp_code[i]
				temp_code[i] = 0
	    end
	  end
	  return right_colour, temp_code, right_colours
	end
end

def computer_guess(turns, guess, right_colours_and_place, right_colours)
	if(turns == 0)
			guess = COLOURS.sample(4)
	else
		guess = []
		(0..3).each do |i|
			if right_colours_and_place[i] != 0
				guess[i] = right_colours_and_place[i]
			else
				guess[i] = 0
			end
		end
	end

	(0..3).each do |i|
		if guess[i] == 0
			if right_colours.length != 0
				guess[i] = right_colours.sample(1)[0]
				right_colours.delete(guess[i])
			else
				guess[i] = COLOURS.sample(1)[0]
			end
		end
	end
	return guess
end

def check_win(guess, secret_code, turns, flag)
	if flag == false
		if(guess == secret_code )
	  	puts "You win! The sequence was #{secret_code}"
	  	return true
	 	end

	  if(turns >= 12)
	  	puts "You lose! The sequence was #{secret_code}"
	  	return true
	  end
	else
		if(guess == secret_code )
	  	puts "You lose! The computer guessed the code."
	  	return true
	 	end

	  if(turns >= 12)
	  	puts "You win! The computer failed to guess the code."
	  	return true
	  end
	end
end

def print_results(right_colour, right_colour_and_place, turns)
	puts "Right colour: #{right_colour}"

	puts "Right colour and place: #{right_colour_and_place}"

	puts "Turns left: #{11 - turns}"
end

def guesser()
	secret_code = COLOURS.sample(4)

	guess = []
	
	puts "You have 12 turns to guess the secret code. The colours used in this game are YELLOW (Y), BLUE (B), PINK (P), GREEN (G), ORANGE (O), RED (R)."

	turns = 0

	loop do
	  temp_code = secret_code.dup
	  
		puts "In order, what colour sequence do you guess (ex. OYBP)"
	  
	  guess = (gets.chomp).split(//)
		
		if check_code(guess)
			puts "Invalid guess. Please try again."
			next
		end
		
		right_colour_and_place, temp_code = count_colour_and_place(temp_code, guess, 0, false)

	  right_colour, temp_code = count_colour(temp_code, guess, 0, false)

	  print_results(right_colour, right_colour_and_place, turns)

  	turns += 1

	  if check_win(guess, secret_code, turns, false)
	  	break
	  end
	end
end

def creator()
	secret_code = []

	turns = 0

	puts "The colours used in this game are YELLOW (Y), BLUE (B), PINK (P), GREEN (G), ORANGE (O), RED (R)."

	loop do
		puts "Please choose your secret code (EX. OYBP)"

		secret_code = gets.chomp.split(//)
		
		if check_code(secret_code)
			puts "Invalid guess. Please try again."
			next
		else
			break
		end
	end

	right_colours_and_place = []
	right_colours = []
	loop do
		temp_code = secret_code.dup

		guess = computer_guess(turns, guess, right_colours_and_place, right_colours)

		puts "The computer guessed: #{guess}"

		right_colour_and_place, temp_code, right_colours_and_place = count_colour_and_place(temp_code, guess, 0, true)

		right_colour, temp_code, right_colours = count_colour(temp_code, guess, 0, true)

	  print_results(right_colour, right_colour_and_place, turns)

		turns += 1

	  if check_win(guess, secret_code, turns, true)
	  	break
	  end
	 end
end

puts "Welcome to Mastermind! What is your name?: "

name = gets.chomp 

puts "Hello #{name}. Would you like to be the guesser (G) or the creator (C)?: "

loop do
	game_type = gets.chomp

	case game_type
		when "G"
			guesser()
			break
		when "C"
			creator()
			break
		else
			puts "Please enter either G or C."
		end
end
