module Mastermind
	class Board
		attr_accessor :pattern, :a, :b, :c, :d
		@@options = ["R","B","Y","W"]
		
		def initialize
			@pattern = {a: " ", b: " ", c: " ", d: " "}
		end

		def set_pattern
			self.pattern.each do |k|
				@pattern[k.to_sym] = @@options.sample
			end 
		end
	end

end