Dir["lib/*.rb"].each {|file| require file }

class Board
	attr_reader :grid
	def initialize
		@grid = []
		3.times do |i|
			@grid << []
			3.times do |j|
				@grid[i][j] = "-"
			end
		end
	end

	def display_grid
		output = ""
		@grid.each do |row|
			line = ""
			row.each do |box|
				line << " #{box} |"
			end
			output << line[0...-2]
			output << "\n-----------\n" unless row.equal? @grid.last
		end
		return output
	end

	def make_move(position, symbol)
		if valid_move?(position)
			@grid[position[0]][position[1]] = symbol
		else
			raise Exceptions::InvalidMoveError, "Invalid move"
		end
		
	end

	def valid_move?(position)
		@grid[position[0]][position[1]] == "-"
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