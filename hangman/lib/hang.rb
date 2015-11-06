module Hangman
	class Game 
		attr_accessor :word, :guess, :victory

		def initialize
			word_selector

			@victory = false
			
			@guesses_remaining = (@word.length * 1.5).to_i 
			@guessed_letters = Array.new
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
			puts "Letters guessed: #{@guessed_letters.join(" ")}"

			print "\n\nGuess a letter:"
			@guess = gets.downcase.chomp

			@guessed_letters << @guess
		end	

		def compare
			comparable = @word.split("")

			comparable.each_with_index do |char,index|
				
				if char == @guess
					@word_obscured[index] = "#{@guess} "
					@guesses_remaining += 1
				end
			
			end
					@guesses_remaining -= 1


		end

		def display
			puts "\n\n"
			puts @word_obscured.join
			puts "\n\nYou have #{@guesses_remaining} guesses remaining."
		end

		def end_game
			if @word_obscured.join.include?("_") && @guesses_remaining <= 0
				puts "GAME OVER"
			elsif @word_obscured.join.include?("_")
				@victory = false
			else
				puts  "\n\nVictory! #{@word}!"

				@victory = true

			end
		end

		#protected

		def word_selector
			dictionary = File.open("./dict/5desk.txt", "r")
			words = dictionary.readlines.map {|line| line.downcase.chomp}

			@word = words.sample
		end


	end
end