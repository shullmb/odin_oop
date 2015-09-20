class Game
	require './tictactoe.rb'

	def newgame
		game = Board.new
		game.start
	end
end

