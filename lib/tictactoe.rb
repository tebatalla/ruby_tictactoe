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
		@grid
	end
end