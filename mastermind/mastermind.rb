require_relative "mind.rb"

game = Mastermind::Board.new

game.choose_difficulty

victory = false

while victory != true do
	game.prompt
	game.compare
	game.display
end

