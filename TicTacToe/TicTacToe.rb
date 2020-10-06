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

	def initialize()
		@board = Array.new(3) { Array.new(3, ' ')}
		@size = 3
	end

	def fill(horizontal, vertical, symbol)
		@board[vertical][horizontal] = symbol
	end

	def display()
		@board.each { |x|
			puts x.join("|")
		}
	end

	def get(horizontal, vertical)
		return @board[vertical][horizontal]
	end

	def win(player)
  	if WINS.any? { |line| line.all? { |square| @board[square[1]][square[0]] == player.symbol } }
    	return true
  	end
	end

	def draw()
		@board.all? { |r| r.all? { |e| e != ' ' } }
	end
end

puts "Welcome to TicTacToe!"
puts "Player 1, what is your name?:"

name = gets.chomp

while name.empty?
	puts "Name can not be blank."
	puts "Player 1, what is your name?:"

	name = gets.chomp
end

player1 = Player.new(name, 'X')

puts "Player 2, what is your name?:"

name = gets.chomp

while name.empty?
	puts "Name can not be blank."
	puts "Player 2, what is your name?:"

	name = gets.chomp
end

player2 = Player.new(name, 'O')

puts "#{player1.name} you are X, #{player2.name} you are O."

puts "Here is the initial TicTacToe board."

board = Board.new()

board.display()

currentPlayer = player1

loop do

	horizontal = 0
	vertical = 0

	while (horizontal < 1 or horizontal > 3) and (vertical < 1 or vertical > 3)
		while horizontal < 1 or horizontal > 3
			puts "Where would you like to place your symbol horizontally (1-3), #{currentPlayer.name}?"

			horizontal = gets.chomp.to_i

			if horizontal < 1 or horizontal > 3
				puts "Please choose a number between 1 and 3."
			end

		end

		while vertical < 1 or vertical > 3
			puts "Where would you like to place your symbol vertically (1-3), #{currentPlayer.name}?"

			vertical = gets.chomp.to_i

			if vertical < 1 or vertical > 3
				puts "Please choose a number between 1 and 3."
			elsif board.get(horizontal-1, vertical-1) != ' '
				puts "There is already a symbol at horizontal: " + horizontal.to_s + " vertical: " + vertical.to_s
				puts "Please choose a different location."
				vertical = 0
				horizontal = 0
				break;
			end
		end
	end

	board.fill(horizontal-1, vertical-1, currentPlayer.symbol)

	puts "Here is the board after #{currentPlayer.name}'s turn."

	board.display()

	if board.win(currentPlayer)
		puts "#{currentPlayer.name} wins!"
		break
	elsif board.draw()
		puts "It's a draw!"
		break
	end

	currentPlayer == player1 ? currentPlayer = player2 : currentPlayer = player1
end

