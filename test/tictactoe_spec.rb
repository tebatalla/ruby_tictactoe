Dir["../../ruby_tictactoe/lib/*.rb"].each {|file| require file }
require 'rspec'


describe "Board" do
	tictactoe = Board.new
	it "returns an initialized grid" do
		expect(tictactoe.display_grid).to eq(" - | - | -\n-----------\n - | - | -\n-----------\n - | - | -")
	end

	it "registers a move" do
		tictactoe.make_move([0, 2], "X")
		expect(tictactoe.display_grid).to eq(" - | - | X\n-----------\n - | - | -\n-----------\n - | - | -")
	end

	it "raises an exception when a player makes an invalid move" do
		expect{tictactoe.make_move([0, 2], "X")}.to raise_error(Exceptions::InvalidMoveError, "Invalid move")
	end
end
describe "Player" do
	it "creates Player 1 with the name Julia and the symbol X" do
		julia = Player.new(1, "Julia")
		expect(julia.turn).to eq(1)
		expect(julia.name).to eq("Julia")
		expect(julia.symbol).to eq("X")
	end
	it "creates Player 2 with the name Tomas and the symbol O" do
		tomas = Player.new(2, "Tomas")
		expect(tomas.turn).to eq(2)
		expect(tomas.name).to eq("Tomas")
		expect(tomas.symbol).to eq("O")
	end
end
describe "Game" do
	it "starts a new game" do
		new_game = Game.new(julia, tomas)
		expect(new_game.board.display_grid).to eq(" - | - | -\n-----------\n - | - | -\n-----------\n - | - | -")
	end

end
