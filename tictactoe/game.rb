class Board
	attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3

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

	def make_move(coordinate)
		coordinate = "X"
	end



end

class Player
	attr_accessor :name, :sym

	def initialize(name, sym)
		@name = name
		@sym = sym
	end

end
