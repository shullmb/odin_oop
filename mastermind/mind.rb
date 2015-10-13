module Mastermind
	class Board
		attr_accessor :pattern, :proposed, :a, :b, :c, :d
		@@options = ["R","G","B","Y","W"]
		@@guess = 0
		
		def initialize
			#@pattern = {a: nil, b: nil, c: nil, d: nil}
			@pattern = Array.new(4)
			@obscured = Array.new(4,"X")
			set_pattern
			puts "\n\n\n"
			puts "|| X || X || X || X ||".center(100)
			puts "\n\n\n\n"
		end

		def display
			puts %Q{
			  ---  ---
			||   ||   ||
			  ---  ---	|| #{self.proposed[0]} || #{self.proposed[1]} || #{self.proposed[2]} || #{self.proposed[3]} ||  
			||   ||   ||
			  ---  ---
			 }
			puts "Guesses left: #{@@guess}".center(100)
			puts "Proposed: #{self.proposed.join}".center(100)			
		end

		def prompt
			print "Proposed pattern: "
			@proposed = gets.chomp.upcase.split("")
		end

		def compare
			self.pattern.each_with_index do |pattern_peg, pattern_index|
				self.proposed.each_with_index do |guess, index|
					if pattern_peg == guess && index == pattern_index
						puts "black"
					elsif pattern_peg == guess && index != pattern_index
						puts "white"
					else
						puts "no match" 
					end
				end
				pattern_peg.include? self.proposed.join
			end
			@@guess -= 1
		end

		private
		def set_pattern
			self.pattern.each_with_index do |value, index|
				value = @@options.sample
				self.pattern[index] = value
			end 
		end
	end

end
			#puts "|| #{self.pattern[:a]} || #{self.pattern[:b]} || #{self.pattern[:c]} || #{self.pattern[:d]} ||".center(100)