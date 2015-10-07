module Mastermind
	class Board
		attr_accessor :pattern, :a, :b, :c, :d
		@@options = ["R","B","Y","W"]
		@@guess = 0
		
		def initialize
			@pattern = {a: " ", b: " ", c: " ", d: " "}
			set_pattern
		end

		def display
			puts "\n\n\n"
			puts "|| #{self.pattern[:a]} || #{self.pattern[:b]} || #{self.pattern[:c]} || #{self.pattern[:d]} ||".center(100)
			puts "\n\n\n\n"
			puts "Guesses: #{@@guess}".center(100)
			
		end

		def prompt
			print "Proposed pattern: "
			@proposed = gets.chomp.upcase
		end

		def compare
			
		end

		private
		def set_pattern
			self.pattern.each do |key, value|
				value = @@options.sample
				self.pattern[key] = value
			end 
		end
	end

end