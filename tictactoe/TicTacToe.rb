class Player
	attr_accessor :name, :symbol

	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end
end

class Board

	WINS = [
  [[0, 0], [1, 0],[2, 0]], [[0, 1],[1, 1], [2, 1]], [[0, 2], [1, 2], [2, 2]],  # <-- Horizontal wins
  [[0,0], [0, 1],[0,2]], [[1,0],[1,1],[1,2]], [[2,0],[2,1],[2,2]],  # <-- Vertical wins
  [[0,0], [1,1], [2,2]], [[2,0], [1,1], [0,2]],             # <-- Diagonal wins
	]

	def initialize
		@board = Array.new(3) { Array.new(3, ' ')}
	end

	def fill(horizontal, vertical, symbol)
		@board[vertical][horizontal] = symbol
	end

	def get(horizontal, vertical)
		return @board[vertical][horizontal]
	end

	def win?(player)
	  	return WINS.any? { |line| line.all? { |square| @board[square[1]][square[0]] == player.symbol } }
	end

	def draw?
		return @board.all? { |r| r.all? { |e| e != ' ' } }
	end

	def display
		@board.each { |x|
			puts x.join("|")
		}
	end
end

class Game 

	def play

		intro

		loop do
			horizontal, vertical = receive_position

			@board.fill(horizontal-1, vertical-1, @currentPlayer.symbol)

			puts "Here is the board after #{@currentPlayer.name}'s turn."

			@board.display

			if @board.win?(@currentPlayer)
				puts "#{@currentPlayer.name} wins!"
				break
			elsif @board.draw?
				puts "It's a draw!"
				break
			end

			@currentPlayer == @player1 ? @currentPlayer = @player2 : @currentPlayer = @player1
		end	
	end

	def intro
		puts "Welcome to TicTacToe!"

		player_one_input
		player_two_input

		puts "#{@player1.name} you are X, #{@player2.name} you are O."
		puts "Here is the initial TicTacToe board."

		@board = Board.new()
		@board.display

		@currentPlayer = @player1
	end
	
	def player_one_input
		puts "Player 1, what is your name?:"

		name = gets.chomp

		while name.empty?
			puts "Name can not be blank."
			puts "Player 1, what is your name?:"

			name = gets.chomp
		end

		@player1 = Player.new(name, 'X')
	end

	def player_two_input
		puts "Player 2, what is your name?:"

		name = gets.chomp
		while name.empty?
			puts "Name can not be blank."
			puts "Player 2, what is your name?:"

			name = gets.chomp
		end

		@player2 = Player.new(name, 'O')
	end

	def horizontal_input
		puts "Where would you like to place your symbol horizontally (1-3), #{@currentPlayer.name}?"

		horizontal = gets.chomp.to_i

		verify_input(horizontal)

		return horizontal
	end

	def vertical_input
		puts "Where would you like to place your symbol vertically (1-3), #{@currentPlayer.name}?"

		vertical = gets.chomp.to_i

		verify_input(vertical)

		return vertical
	end

	def position_taken?(horizontal, vertical)
		return ['X', 'O'].include?(@board.get(horizontal-1, vertical-1))
	end

	def receive_position
		horizontal = 0
		vertical = 0

		while (horizontal < 1 or horizontal > 3) and (vertical < 1 or vertical > 3)
			while horizontal < 1 or horizontal > 3
				horizontal = horizontal_input
			end

			while vertical < 1 or vertical > 3
				vertical = vertical_input
			end

			if position_taken?(horizontal, vertical)
				puts "There is already a symbol at horizontal: " + horizontal.to_s + " vertical: " + vertical.to_s
				puts "Please choose a different location."
				vertical = 0
				horizontal = 0
			end
		end
		return horizontal, vertical
	end

	private

	def verify_input(input)
		if input < 1 or input > 3
			puts "Please choose a number between 1 and 3."
		end
	end
end

#game = Game.new
#game.play