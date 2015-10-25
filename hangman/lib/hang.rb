module Hangman
	class Game 
		attr_accessor :dictionary, :word

		def initialize
			@dictionary = File.open("../dict/5desk.txt", "r")
			word_selector
		end	

		#protected

		def word_selector
			words = @dictionary.readlines.map {|line| line.chomp}

			@word = words.sample
		end


	end
end