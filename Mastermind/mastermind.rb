colours = ['Y', 'B', 'P', 'G', 'O', 'R']

secret_code = colours.sample(4)

puts "Welcome to Mastermind! What is your name?"

name = gets.chomp 

guess = []

puts "Hello #{name}! You have 12 turns to guess the secret code. The colours used in this game are YELLOW (Y), BLUE (B), PINK (P), GREEN (G), ORANGE (O), RED (R)."

turns = 0

loop do
  
  temp_code = secret_code.dup
  
	puts "In order, what colour sequence do you guess (ex. OYBP)"
  
  guess = (gets.chomp).split(//)
	
	if guess.length < 4 or guess.length > 4 or !(guess - colours).empty?
		puts "Invalid guess. Please try again."
		next
	end

	right_colour = 0
	right_colour_and_place = 0
	
	(0..3).each do |i|
		if temp_code[i] == guess[i] 
			right_colour_and_place += 1
			temp_code[i] = 0
    end
  end

  (0..3).each do |i|
		if guess.include? temp_code[i] 
			right_colour += 1
			temp_code[i] = 0
    end
  end

  puts "Right colour: #{right_colour}"
  puts "Right colour and place: #{right_colour_and_place}"
  puts "Turns left: #{11 - turns}"

  if(guess == secret_code )
  	puts "You win! The sequence was #{secret_code}"
  	break
 	end

  turns += 1

  if(turns >= 12)
  	puts "You lose! The sequence was #{secret_code}"
  	break
  end
end