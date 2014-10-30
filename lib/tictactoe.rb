Dir["lib/*.rb"].each {|file| require file }

class Game

	attr_reader :board, :player1, :player2

	@@winning_combos = [
						[0, 1, 2],
						[3, 4, 5],
						[6, 7, 8],
						[0, 3, 6],
						[1, 4, 7],
						[2, 5, 8],
						[0, 4, 8],
						[2, 4, 6]
						]

	def initialize(player1_name, player2_name)
		@board = Board.new
		@player1 = Player.new(1, player1_name)
		@player2 = Player.new(2, player2_name)
	end

	def turn(player)
		@board.display_grid
		puts "#{player.name}, please make a move (e.g. top left is 0, bottom right is 8)"
		begin
			position = gets.chomp.to_i
			@board.make_move!(position, player.symbol)
		rescue InvalidMoveError => e
			puts e
			turn(player)
		end
	end
	# Checks to see if player has won the game
	def won_game?(player)
		player_spots = @board.grid.each_index.select { |spot| @board.grid[spot] == player.symbol }
		@@winning_combos.any? do |combo|
			player_spots & combo == combo
		end
	end

	class Board
		attr_reader :grid
		def initialize
			@grid = []
			9.times do |i|
				@grid[i] = "-"
			end
		end

		def display_grid
			output = ""
			@grid.each_with_index do |box, position|
				output << " #{box} "
				output << "|" if [0, 1, 3, 4, 6, 7].include? position 
				output << "\n-----------\n" if [2, 5].include? position 
			end
			return output
		end

		def make_move!(position, symbol)
			if valid_move?(position)
				@grid[position] = symbol
			else
				raise Exceptions::InvalidMoveError, "Invalid move"
			end
			
		end

		def valid_move?(position)
			@grid[position] == "-"
		end
	end

	class Player
		attr_accessor :name, :turn
		attr_reader :symbol

		def initialize(turn, name)
			@name = name
			@turn = turn
			@symbol = turn == 1 ? "X" : "O"
		end

	end

end