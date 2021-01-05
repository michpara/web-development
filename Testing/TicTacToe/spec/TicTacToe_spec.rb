require_relative '../TicTacToe.rb'

describe Board do

	subject(:board) { described_class.new() }
	let(:player_one) { double('player', name: 'Michelle', symbol: 'X') }
	let(:player_two) { double('player', name: 'Carmen', symbol: 'O') }

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

	describe '#get' do
		context 'when get is called on a position' do
			it "returns the right symbol for the position" do
				board.instance_variable_set(:@board, [['X', ' ', ' '], [' ', 'X', ' '], [' ', ' ', 'X']]) 
				symbol = board.get(0, 0)
				expect(symbol).to eq('X')
			end
		end
	end

	describe '#fill' do
		context 'when fill is called on a position' do
			it "fills the position with the right symbol" do
				board.instance_variable_set(:@board, [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]) 
				board.fill(1, 2, 'O')
				symbol = board.get(1, 2)
				expect(symbol).to eq('O')
			end
		end
	end
end

describe Game do
	subject(:game) { described_class.new }
	let(:player_one) { double('player', name: 'Michelle', symbol: 'X') }
	let(:player_two) { double('player', name: 'Carmen', symbol: 'O') }
	let(:board) { instance_double(Board) }

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
			it 'calls verify_input once' do
				expect(game).to receive(:verify_input).once
				game.horizontal_input
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
			it 'calls verify_input once' do
				expect(game).to receive(:verify_input).once
				game.vertical_input
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

	describe '#position_taken?' do
		before do
			allow(board).to receive(:get).with(1, 2).and_return(' ')
			allow(board).to receive(:get).with(0, 1).and_return('X')
		end
		context 'when a position is not taken' do
			it 'returns false' do
				horizontal = 2
				vertical = 3
				game.instance_variable_set(:@board, board)
				taken = game.position_taken?(horizontal, vertical)
				expect(taken).to eq(false)
			end
		end
		context 'when a position is taken' do
			it 'returns true' do
				horizontal = 1
				vertical = 2
				game.instance_variable_set(:@board, board)
				taken = game.position_taken?(horizontal, vertical)
				expect(taken).to eq(true)
			end
		end
	end

	describe '#receive_position' do
		before do
			allow(board).to receive(:get).with(1, 2).and_return(' ')
			allow(game).to receive(:horizontal_input).and_return(0, 2)
			allow(game).to receive(:vertical_input).and_return(0, 4, 3)
		end
		context 'horizontal input is invalid once then valid' do
			it '' do
				game.instance_variable_set(:@board, board)
				expect(game).to receive(:horizontal_input).twice
				game.receive_position
			end
		end
		context 'when vertical input is invalid twice then valid' do
			it '' do
				game.instance_variable_set(:@board, board)
				expect(game).to receive(:vertical_input).exactly(3).times
				game.receive_position
			end
		end
		context 'when receive_position is called and both horizontal and vertical input are valid' do
			it 'calls position_taken? once' do
				game.instance_variable_set(:@board, board)
				expect(game).to receive(:position_taken?).once
				game.receive_position
			end
		end
	end
end
