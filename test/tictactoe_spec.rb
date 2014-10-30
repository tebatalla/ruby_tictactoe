Dir["../../ruby_tictactoe/lib/*.rb"].each {|file| require file }
require 'rspec'

new_game = Game.new("Julia", "Tomas")
tictactoe = new_game.board
describe "Board" do
	it "returns an initialized grid" do
		expect(tictactoe.display_grid).to eq(" - | - | - \n-----------\n - | - | - \n-----------\n - | - | - ")
	end

	it "registers a move" do
		tictactoe.make_move!(2, "X")
		expect(tictactoe.display_grid).to eq(" - | - | X \n-----------\n - | - | - \n-----------\n - | - | - ")
	end

	it "raises an exception when a player makes an invalid move" do
		expect{tictactoe.make_move!(2, "X")}.to raise_error(Exceptions::InvalidMoveError, "Invalid move")
	end
end
describe "Player" do
	it "creates Player 1 with the name Julia and the symbol X" do
		julia = new_game.player1
		expect(julia.turn).to eq(1)
		expect(julia.name).to eq("Julia")
		expect(julia.symbol).to eq("X")
	end
	it "creates Player 2 with the name Tomas and the symbol O" do
		tomas = new_game.player2
		expect(tomas.turn).to eq(2)
		expect(tomas.name).to eq("Tomas")
		expect(tomas.symbol).to eq("O")
	end
end
describe "Game" do
	it "correctly checks if a player has won the game" do
		tictactoe.make_move!(0, "X")
		tictactoe.make_move!(1, "X")
		expect(new_game.won_game?(new_game.player1)).to eq(true)
	end
end
