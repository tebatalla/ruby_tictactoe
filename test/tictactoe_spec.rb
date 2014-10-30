require_relative '../lib/tictactoe'
require 'rspec'

describe "Game" do 
	describe "Board" do

		it "returns an initialized grid" do
			tictactoe = Board.new
			expect(tictactoe.display_grid).to eq(" - | - | -\n-----------\n - | - | -\n-----------\n - | - | -")
		end

		it "registers a move" do
			tictactoe = Board.new
			tictactoe.make_move([0, 2], "X")
			expect(tictactoe.display_grid).to eq(" - | - | X\n-----------\n - | - | -\n-----------\n - | - | -")
		end
	end
	describe "Player" do

		it "creates Player 1 with the name Julia and the symbol X" do
			julia = Player.new(1, "Julia", "x")
			expect(julia.turn).to eq(1)
			expect(julia.name).to eq("Julia")
			expect(julia.symbol).to eq("X")
		end
	end
end