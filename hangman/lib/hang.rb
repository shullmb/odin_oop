module Hangman
	class Game 
		attr_accessor :word, :guess

		def initialize
			word_selector

			@guesses_remaining = (@word.length * 1.5).to_i 

			@word_obscured = Array.new
			@word.length.times do
				@word_obscured << "_ "
			end

			puts "Welcome to Hangman\n\n"
			puts @word_obscured.join
			puts "\n\nThe word is #{@word.length} letters long."
			puts "\n\nYou have #{@guesses_remaining} guesses remaining."
		end

		def setup_board
		end

		def prompt
			print "Guess a letter:"
			@guess = gets.chomp
		end	

		def compare
			comparable = @word.split("")

			comparable.each_with_index do |char,index|
				
				if char == @guess
					@word_obscured[index] = "#{@guess} "
				end
			
			end

			@guesses_remaining -= 1

		end

		def display
			puts @word_obscured.join
			puts "\n\nYou have #{@guesses_remaining} guesses remaining."
		end

		#protected

		def word_selector
			dictionary = File.open("../dict/5desk.txt", "r")
			words = dictionary.readlines.map {|line| line.chomp}

			@word = words.sample
		end


	end
end