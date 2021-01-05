require_relative '../tic_tac_toe.rb'

describe Board do

	subject(:board) { described_class.new() }
	let(:player_one) { double('player', name: 'Michelle', symbol: 'X') }
	let(:player_two) { double('player', name: 'Carmen', symbol: 'O') }

	describe '#fill' do
		context 'when fill is called on a position' do
			it "fills the position with the right symbol" do
				horizontal, vertical = 1, 2
				board.instance_variable_set(:@board, [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]) 
				board.fill(horizontal, vertical, 'O')
				symbol = board.get(horizontal, vertical)
				expect(symbol).to eq('O')
			end
		end
	end

	describe '#get' do
		context 'when get is called on a position' do
			it "returns the right symbol for the position" do
				horizontal, vertical = 0, 0
				board.instance_variable_set(:@board, [['X', ' ', ' '], [' ', 'X', ' '], [' ', ' ', 'X']]) 
				symbol = board.get(horizontal, vertical)
				expect(symbol).to eq('X')
			end
		end
	end

	describe '#win?' do
		context 'player wins with top row' do
			it 'returns true for that player' do
				board.instance_variable_set(:@board, [['X', 'X', 'X'], [' ', ' ', ' '], [' ', ' ', ' ']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end

		context 'player wins with middle row' do
			it 'returns true for that player' do
				board.instance_variable_set(:@board, [[' ', ' ', ' '], ['X', 'X', 'X'], [' ', ' ', ' ']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end

		context 'player wins with bottom row' do
			it 'returns true for that player' do
				board.instance_variable_set(:@board, [[' ', ' ', ' '], [' ', ' ', ' '], ['X', 'X', 'X']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end

		context 'player wins with top column' do
			it 'returns true for the player' do
				board.instance_variable_set(:@board, [['X', ' ', ' '], ['X', ' ', ' '], ['X', ' ', ' ']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end
			
		context 'player wins with middle column' do
			it 'returns true for the player' do
				board.instance_variable_set(:@board, [[' ', 'X', ' '], [' ', 'X', ' '], [' ', 'X', ' ']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end

		context 'player wins with bottom column' do
			it 'returns true for the player' do
				board.instance_variable_set(:@board, [[' ', ' ', 'X'], [' ', ' ', 'X'], [' ', ' ', 'X']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end

		context 'player wins with left diagonal' do
			it 'returns true for the player' do
				board.instance_variable_set(:@board, [['X', ' ', ' '], [' ', 'X', ' '], [' ', ' ', 'X']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end

		context 'player wins with right diagonal' do
			it 'returns true for the player' do
				board.instance_variable_set(:@board, [[' ', ' ', 'X'], [' ', 'X', ' '], ['X', ' ', ' ']]) 
				first_result = board.win?(player_one)
				second_result = board.win?(player_two)
				expect(first_result).to equal(true)
				expect(second_result).to equal(false)
			end
		end
	end

	describe '#draw?' do
		context 'when the board is filled with no winner' do
			it 'return true' do
				board.instance_variable_set(:@board, [['X', 'O', 'X'], ['X', 'O', 'O'], ['O', 'X', 'O']]) 
				result = board.draw?
				expect(result).to equal(true)
			end
		end
	end

	describe '#display' do
		# (Public Script Method)
		# Only contains puts statements -> No test necessary.
	end
end

describe Game do
	subject(:game) { described_class.new }
	subject(:position_game) { described_class.new }
	let(:player_one) { double('player', name: 'Michelle', symbol: 'X') }
	let(:player_two) { double('player', name: 'Carmen', symbol: 'O') }
	let(:board) { instance_double(Board) }

	describe '#play' do
		before do
			allow(game).to receive(:intro)
			allow(game).to receive(:receive_position).and_return([1, 2])
			allow(board).to receive(:fill)
		end
		context 'when win? is true' do
			before do
				game.instance_variable_set(:@player1, player_one)
				game.instance_variable_set(:@player2, player_two)
				game.instance_variable_set(:@currentPlayer, player_one)
				game.instance_variable_set(:@board, board)

				allow(board).to receive(:win?).and_return(true)
				allow(board).to receive(:draw?)
			end
			it 'sends fill to board' do
				expect(board).to receive(:fill).with(0, 1, 'X')
				game.play
			end
			it 'draw? is never called' do
				expect(board).not_to receive(:draw?)
				game.play
			end
		end
		context 'when win? is false and then true' do	
			before do
				game.instance_variable_set(:@player1, player_one)
				game.instance_variable_set(:@player2, player_two)
				game.instance_variable_set(:@currentPlayer, player_one)
				game.instance_variable_set(:@board, board)

				allow(board).to receive(:win?).and_return(false, true)
				allow(board).to receive(:draw?).and_return(false)
			end
			it 'calls draw once' do
				expect(board).to receive(:draw?).once
				game.play
			end
			it 'changes the state of currentPlayer' do
				expect {game.play}.to change {game.instance_variable_get(:@currentPlayer)}
			end
		end
		context 'when win? is false and draw? is true' do
			before do
				game.instance_variable_set(:@player1, player_one)
				game.instance_variable_set(:@player2, player_two)
				game.instance_variable_set(:@currentPlayer, player_one)
				game.instance_variable_set(:@board, board)

				allow(board).to receive(:win?).and_return(false)
				allow(board).to receive(:draw?).and_return(true)
			end
			it 'calls win? and draw? once' do
				expect(board).to receive(:draw?).once
				expect(board).to receive(:win?).once
				game.play
			end
		end
	end

	describe '#intro' do
		before do
			allow(game).to receive(:gets).and_return('Michelle')
		end
		context 'when intro is called' do
			it 'change the state of currentPlayer to player1' do
				expect {game.intro}.to change {game.instance_variable_get(:@currentPlayer)}
			end
		end
	end

	describe '#player_one_input' do
		context 'when player_one_input is called twice with an empty string and once with a valid string' do
			before do
				allow(game).to receive(:gets).and_return('', '', 'Michelle')
			end
			it 'return the first puts and 4 error puts (2 per empty string)' do
				expect(game).to receive(:puts).exactly(5).times
				game.player_one_input
			end
			it 'changes the state of player1' do
				expect {game.player_one_input}.to change {game.instance_variable_get(:@player1)}
			end
		end
	end

	describe '#player_two_input' do
		context 'when player_two_input is called once with an empty string and once with a valid string' do
			before do
				allow(game).to receive(:gets).and_return('', 'Carmen')
			end
			it 'return the first puts and 2 error puts (2 per empty string)' do
				expect(game).to receive(:puts).exactly(3).times
				game.player_two_input
			end
			it 'changes the state of player2' do
				expect {game.player_two_input}.to change {game.instance_variable_get(:@player2)}
			end
		end
	end

	describe '#horizontal_input' do
		context 'when horizontal input is called' do
			before do
				game.instance_variable_set(:@currentPlayer, player_one)
				horizontal = '2'
				allow(game).to receive(:gets).and_return(horizontal)
			end
			it 'returns the horizontal input' do
				horizontal_input = game.horizontal_input
				expect(horizontal_input).to eq(2)
			end
		end
	end

	describe '#vertical_input' do
		context 'when vertical input is called' do
			before do
				game.instance_variable_set(:@currentPlayer, player_one)
				vertical = '2'
				allow(game).to receive(:gets).and_return(vertical)
			end
			it 'returns the vertical input' do
				vertical_input = game.vertical_input
				expect(vertical_input).to eq(2)
			end
		end
	end

	describe '#position_taken?' do
		before do
			allow(board).to receive(:get).with(1, 2).and_return(' ')
			allow(board).to receive(:get).with(0, 1).and_return('X')
		end
		context 'when a position is not taken' do
			it 'returns false' do
				horizontal, vertical = 2, 3
				game.instance_variable_set(:@board, board)
				taken = game.position_taken?(horizontal, vertical)
				expect(taken).to eq(false)
			end
		end
		context 'when a position is taken' do
			it 'returns true' do
				horizontal, vertical = 1, 2
				game.instance_variable_set(:@board, board)
				taken = game.position_taken?(horizontal, vertical)
				expect(taken).to eq(true)
			end
		end
	end

	describe '#receive_position' do
		before do
			allow(board).to receive(:get).with(1, 2).and_return(' ')
			allow(game).to receive(:horizontal_input).and_return(0, 2, 2)
			allow(game).to receive(:vertical_input).and_return(0, 4, 3, 3)

			allow(position_game).to receive(:position_taken?).and_return(true, false)
			allow(position_game).to receive(:horizontal_input).and_return(2, 2)
			allow(position_game).to receive(:vertical_input).and_return(3, 3)
		end
		context 'horizontal input is invalid once then valid' do
			it 'call horizontal_input twice' do
				game.instance_variable_set(:@board, board)
				expect(game).to receive(:horizontal_input).twice
				game.receive_position
			end
		end
		context 'when vertical input is invalid twice then valid' do
			it 'call vertical_input three times' do
				game.instance_variable_set(:@board, board)
				expect(game).to receive(:vertical_input).exactly(3).times
				game.receive_position
			end
		end
		context 'when position_taken? returns false' do
			it 'repeats the loop a second time' do
				position_game.instance_variable_set(:@board, board)
				expect(position_game).to receive(:position_taken?).twice
				position_game.receive_position
			end
		end
	end

	describe '#verify_input' do
		# (Public Script Method)
		# Only contains puts statements + private -> No test necessary.
	end
end
