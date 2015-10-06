module TicTacToe

	class Board
		attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :player1, :player2, :coordinate
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
			#{player1.name}: #{player1.sym}
			#{player2.name}: #{player2.sym}
				 --- --- ---
				| #{@a1} | #{@a2} | #{@a3} |
				 --- --- ---
				| #{@b1} | #{@b2} | #{@b3} |	
				 --- --- ---
				| #{@c1} | #{@c2} | #{@c3} |
				 --- --- ---	
			
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
			@@turn = 0
			display
		end

		def victory_check
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

		def make_move(coordinate, sym)
			case coordinate
				when "a1"
					self.a1 ||= sym
				when "a2"
					self.a2 = sym
				when "a3"
					self.a3 = sym
				when "b1"
					self.b1 = sym
				when "b2"
					self.b2 = sym
				when "b3"
					self.b3 = sym
				when "c1"
					self.c1 = sym
				when "c2"
					self.c2 = sym
				when "c3"
					self.c3 = sym
				else
					puts "Try again"
					prompt
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
