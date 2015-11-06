# Hangman #

require './lib/hang.rb'

game = Hangman::Game.new

while game.victory == false do

	game.prompt
	game.compare
	game.display
	game.end_game


end