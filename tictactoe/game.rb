module TicTacToe

	class Board
		attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :player1, :player2
		@@turn = 1
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
				 --- --- ---
				| #{@a1} | #{@a2} | #{@a3} |
				 --- --- ---
				| #{@b1} | #{@b2} | #{@b3} |	
				 --- --- ---
				| #{@c1} | #{@c2} | #{@c3} |
				 --- --- ---	
			}
		end
		
		def prompt
			print "make a move: "
			coordinate = gets.chomp.downcase.to_sym

			if @@turn%2 == 1
			make_move(coordinate, player1.sym)
			elsif @@turn%2 == 0
			make_move(coordinate, player2.sym)
			end
		end

		def make_move(coordinate, sym)
			coordinate = sym
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

