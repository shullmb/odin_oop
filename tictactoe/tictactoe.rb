
class Board
	attr_accessor :grid_1, :grid_2, :grid_3
	def initialize
		@grid_1 = [" ", " ", " "]
		@grid_2 = [" ", " ", " "]
		@grid_3 = [" ", " ", " "]
			
	end	

	def start
		puts "Welcome!"
		puts "Player 1, please choose a name: "
		name_1 = gets.chomp.to_s
		puts "and a symbol: "
		sym_1 = gets.chomp.upcase
		@player1 = Player.new(name_1, sym_1)
		puts "Player 2, please choose a name:"
		name_2 = gets.chomp.upcase
		puts "and a symbol: "
		sym_2 = gets.chomp.upcase
		@player2 = Player.new(name_2, sym_2)

		display
	end

	def display
		puts %Q{
#{player1}: #{sym_1}
#{player2}: #{sym_2}
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
		puts "#{player1} is victorious!"
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

until victory do 
	
end