require_relative '../lib/tictactoe'
require 'rspec'

describe "Game" do 
	describe "Board" do
		it "returns an initialized grid" do
			tictactoe = Board.new
			expect(tictactoe.display_grid).to eq(" - | - | -\n-----------\n - | - | -\n-----------\n - | - | -")
			puts tictactoe.display_grid
		end
	end
end