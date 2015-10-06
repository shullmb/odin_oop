module TicTacToe

	class Board
		attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :player1, :player2, :coordinate
		
		@@turn = 1
		@@victory = false

		def initialize
			@a1 = ' '
			@a2 = ' '
			@a3 = ' '
			@b1 = ' '
			@b2 = ' '
			@b3 = ' '
			@c1 = ' '
			@c2 = ' '
			@c3 = ' '
			print "Player 1 name: "
			p1_name = gets.chomp.upcase
			@player1 = Player.new(p1_name, "X")
			print "Player 2 name: "
			p2_name = gets.chomp.upcase
			@player2 = Player.new(p2_name, "O")
		end

		def display
			puts %Q{
			#{player1.name}: #{player1.sym}
			#{player2.name}: #{player2.sym}
				  --- --- ---
				A| #{@a1} | #{@a2} | #{@a3} |
				  --- --- ---
				B| #{@b1} | #{@b2} | #{@b3} |	
				  --- --- ---
				C| #{@c1} | #{@c2} | #{@c3} |
				  --- --- ---	
				   1   2   3
			turn: #{@@turn}}
		end

		def reset
			@a1 = ' '
			@a2 = ' '
			@a3 = ' '
			@b1 = ' '
			@b2 = ' '
			@b3 = ' '
			@c1 = ' '
			@c2 = ' '
			@c3 = ' '
			@@turn = 1
			display
		end

		def victory_check?
			victory_cases = [[@a1,@a2,@a3],
							 [@b1,@b2,@b3],
							 [@c1,@c2,@c3],
							 [@a1,@b2,@c3],
							 [@c1,@b2,@a3],
							 [@a1,@b1,@c1],
							 [@a2,@b2,@c2],
							 [@a3,@b3,@c3]]

			victory_cases.each_with_index do |coord, index|
				if (victory_cases[index][0] == victory_cases[index][1] && victory_cases[index][0] == victory_cases[index][2]) && (victory_cases[index][0] != " ")
					puts "Victory!"
					return true
				end
			end
		end

		def force_win
			@a1,@a2,@a3 = "M","M","M"
		end
		
		def prompt
			print "make a move: "
			coordinate = gets.chomp.downcase

			if @@turn%2 == 1
			make_move(coordinate, player1.sym)
			elsif @@turn%2 == 0
			make_move(coordinate, player2.sym)
			end
			@@turn += 1
		end

		def try_again
			puts " Invalid selection. Try again."
			@@turn -= 1
			
		end 

		def make_move(coordinate, sym)
			case coordinate
			when "a1"
				self.a1 == " "? self.a1 = sym : try_again	
			when "a2"
				self.a2 == " "? self.a2 = sym : try_again
			when "a3"
				self.a3 == " "? self.a3 = sym : try_again
			when "b1"
				self.b1 == " "? self.b1 = sym : try_again
			when "b2"
				self.b2 == " "? self.b2 = sym : try_again
			when "b3"
				self.b3 == " "? self.b3 = sym : try_again
			when "c1"
				self.c1 == " "? self.c1 = sym : try_again
			when "c2"
				self.c2 == " "? self.c2 = sym : try_again
			when "c3"
				self.c3 == " "? self.c3 = sym : try_again
			else
				try_again
			end
			display
		end
	end

	class Player
		attr_accessor :name, :sym

		def initialize(name, sym)
			@name = name
			@sym = sym
		end

	end

	class Game < Board
		attr_accessor :game

		def initialize
			@game = Board.new

			@game.display
		end 

	end

end

new = TicTacToe::Game.new

while new.game.victory_check? != true
	new.game.prompt
end

print "Would you like to play again? "

answer = gets.chomp.downcase[0]

if answer == "y"
	new.game.reset
	# need to reinitialize game
else
	puts "Thank you for playing"
end
		
