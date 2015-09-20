
class Board
	attr_accessor :grid_1, :grid_2, :grid_3
	def initialize
		@grid_1 = [" ", " ", " "]
		@grid_2 = [" ", " ", " "]
		@grid_3 = [" ", " ", " "]
			
	end	

	def start
		puts "Welcome!"
		# print "Player 1, please choose a name: "
		# name_1 = gets.chomp.to_s
		# print "and a symbol: "
		# sym_1 = gets.chomp.upcase
		# @player1 = Player.new(name_1, sym_1[0])
		# print "Player 2, please choose a name: "
		# name_2 = gets.chomp.to_s
		# print "and a symbol: "
		# sym_2 = gets.chomp.upcase
		# @player2 = Player.new(name_2, sym_2[0])
		players = ["Player 1", "Player 2"]
		players.each {prompt}

		display
	end

	def prompt
		print "Please choose a name: "
		name = gets.chomp.to_s
		print "and a symbol: "
		sym = gets.chomp.upcase
		@player = Player.new(name, sym[0])
	end
	#need to break start up into multiple methods and add validation

	def display
		puts %Q{
#{@player1.name}: #{@player1.sym}
#{@player2.name}: #{@player2.sym}
		 --- --- ---
		| #{grid_1[0]} | #{grid_1[1]} | #{grid_1[2]} | 1
		 --- --- ---
		| #{grid_2[0]} | #{grid_2[1]} | #{grid_2[2]} | 2
		 --- --- ---			
		| #{grid_3[0]} | #{grid_3[1]} | #{grid_3[2]} | 3
		 --- --- ---
		  A   B   C
 		}
	end

	def victory
		#add comparison cases
		puts "#{player} is victorious!"
	end
	
	class Player
		attr_accessor :name
		attr_reader :sym
		def initialize(name, sym)
			@name = name
			@sym = sym
		end
		def turn
			#prompt player for selection

		end
	end
end

tictactoe = Board.new

tictactoe.start