module Hangman
	class Game 
		attr_reader :dictionary
		attr_accessor :word, :guess

		def initialize
			@dictionary = File.open("../dict/5desk.txt", "r")
			word_selector

			@guesses_remaining = 8
		end

		def setup_board
			puts "Welcome to Hangman\n\n"
			@word.length.times do
				print " _ "
			end
			puts "\n\nThe word is #{@word.length} letters long."
			puts "\n\nYou have #{@guesses_remaining} guesses remaining."
		end

		def prompt
			print "Guess a letter:"
			@guess = gets.chomp
		end	

		def compare

		end

		def display
			puts "\n\nYou have #{@guesses_remaining} guesses remaining."
		end

		#protected

		def word_selector
			words = @dictionary.readlines.map {|line| line.chomp}

			@word = words.sample
		end


	end
end