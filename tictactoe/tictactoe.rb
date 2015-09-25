
class Board
	attr_accessor :grid_1, :grid_2, :grid_3, :turn
	

	def initialize
		@grid_1 = [" ", " ", " "]
		@grid_2 = [" ", " ", " "]
		@grid_3 = [" ", " ", " "]
		@turn = 0
			
	end	

	def start
		puts "Welcome!"
		print "Player 1, please choose a name: "
		name_1 = gets.chomp.to_s
		print "and a symbol: "
		sym_1 = gets.chomp.upcase
		@player1 = Player.new(name_1, sym_1[0])
		print "Player 2, please choose a name: "
		name_2 = gets.chomp.to_s
		print "and a symbol: "
		sym_2 = gets.chomp.upcase
		@player2 = Player.new(name_2, sym_2[0])

		display
		@turn += 1
	end

	def prompt(player)		
		print " #{player} select your coordinate: "
		@move = gets.chomp.upcase
	end

	def take_turn
		if @turn%2 == 1
			prompt(@player1.name)
			@player1.execute_turn(@move)
		else
			prompt(@player2.name)
			@player2.execute_turn(@move)
		end

		display
		@turn += 1
	end

	def display
		puts %Q{
#{@player1.name}: #{@player1.sym}
#{@player2.name}: #{@player2.sym}
Turn: #{@turn}
		 --- --- ---
		| #{grid_1[0]} | #{grid_1[1]} | #{grid_1[2]} | A
		 --- --- ---
		| #{grid_2[0]} | #{grid_2[1]} | #{grid_2[2]} | B
		 --- --- ---			
		| #{grid_3[0]} | #{grid_3[1]} | #{grid_3[2]} | C
		 --- --- ---
		  1   2   3
 		}
	end

	def victory
		#add comparison cases
		puts "#{player} is victorious!"
	end
	
	class Player
		attr_accessor :name
		attr_reader :sym
		
		@@players = []

		def initialize(name, sym)
			@name = name
			@sym = sym
		end
		
		def execute_turn(move)
			case move[0]
			when "A"
				case move[1]
				when 1
					grid_1[0] = @sym
				when 2
					grid_1[1] = @sym
				when 3
					grid_1[2] = @sym
				end
			when "B"
				case move[1]
				when 1
					grid_2[0] = @sym
				when 2
					grid_2[1] = @sym
				when 3
					grid_2[2] = @sym
				end
			when "C"
				case move[1]
				when 1
					grid_3[0] = @sym
				when 2
					grid_3[1] = @sym
				when 3
					grid_3[2] = @sym
				end
			else 
				puts "that is not a valid selection"
			end
		end
	end
end

game = Board.new
game.start

while  game.turn < 10

	game.take_turn

end
