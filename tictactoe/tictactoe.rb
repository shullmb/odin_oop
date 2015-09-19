
class Board
	attr_accessor :grid_1, :grid_2, :grid_3
	def initialize
		@grid_1 = [" ", " ", " "]
		@grid_2 = [" ", " ", " "]
		@grid_3 = [" ", " ", " "]
			
	end	

	def start
		display
	end

	def display
		puts %Q{
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
	
	class Player
		attr_accessor :name
		def initialize(name)
			@name = name
		end
		def turn
			#prompt player for selection

		end
	end
end