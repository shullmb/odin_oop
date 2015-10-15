module Mastermind
	class Board
		attr_accessor :pattern, :proposed, :guess, :a, :b, :c, :d
		@@options = ["R","G","B","Y","W"]
		@@screen_width = 100
		
		def initialize
			#@pattern = {a: nil, b: nil, c: nil, d: nil}
			@pattern = Array.new(4)
			@guess = 0
			set_pattern
			display_obscured_code
			puts "Pattern Set!".center(@@screen_width)
			puts "\n\n\n\n"
		end

		def choose_difficulty
			puts "Easy, Normal, or Hard?".center(@@screen_width)
			choice = gets.chomp.upcase[0]

			case choice
				when "E"
					@guess = 16
				when "N"
					@guess = 12
				when "H"
					@guess = 8
				else
					puts "That is not a valid choice"
			end
					puts "You have #{@guess} guesses to determine the pattern".center(@@screen_width)

		end

		def display_obscured_code
			puts "\n\n\n"
			puts "|| X || X || X || X ||".center(@@screen_width)
			puts "\n\n"
		end

		def display
			puts %Q{
			  ---  ---
			||   ||   ||
			  ---  ---	|| #{self.proposed[0]} || #{self.proposed[1]} || #{self.proposed[2]} || #{self.proposed[3]} ||  
			||   ||   ||
			  ---  ---
			 }
			puts "Guesses left: #{@@guess}".center(@@screen_width)
			puts "Proposed: #{self.proposed.join}".center(@@screen_width)			
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
			@guess -= 1
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
			#puts "|| #{self.pattern[:a]} || #{self.pattern[:b]} || #{self.pattern[:c]} || #{self.pattern[:d]} ||".center(@@screen_width)