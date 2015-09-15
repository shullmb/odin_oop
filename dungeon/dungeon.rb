#Dungeon Explorer

class Dungeon
	attr_accessor :player
	
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	def start(location)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	def find_room_in_dungeon(reference)
		@rooms.detect { |room| room.reference == reference}
	end

	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end

	def go(direction)
		puts "You go " + direction.to_s
		@player.location = find_room_in_direction(direction)
		show_current_description
	end

	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end

	class Player
		attr_accessor :name, :location, :hp, :mana
		def initialize(name, hp = 100, mana = 25)
			@name = name
			@hp = hp
			@mana = mana
		end

		def hit_by_monster(damage)
			@hp -= damage

			puts "You are hit for #{damage} points."

			if @hp <= 0
				puts "You are dead."
				@hp = 0

			elsif @hp.between?(1,15)
				puts "You are critically wounded."
			end
			puts "You have #{@hp}hp left"
		end

	end

	class Room
		attr_accessor :reference, :name, :description, :connections
		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		def full_description
			puts @name + "\n\nYou are in #{@description}.\n\n"

			puts @connections.keys.to_s #maybe comment out when built completely 
		end
	end

	class Monster
		attr_accessor :name, :hp

		def initialize(name, hp)
			@name = name
			@hp = hp
		end

		def attack(damage)
			#CODE ME
		end
	end

end

#Create Dungeon Instance
malistan = Dungeon.new("placeholder")

#Add rooms
malistan.add_room(:field, "the Killing Field", "a field scarred by war. There is nowhere to go, but north into the cave",{:north => :cave_mouth})
malistan.add_room(:cave_mouth, "Mouth of Cave", "the mouth of a cave", { :south => :field, :north => :first_chamber})
malistan.add_room(:first_chamber, "First Chamber", "a damp chamber in the cave", {:south => :cave_mouth, :north => :shadow_hall})
malistan.add_room(:shadow_hall,"Shadow Hall", "a narrow hall. You can only go forward... or turn back", {:north => :darkness, :south => :first_chamber})
malistan.add_room(:darkness, "Darkness", "a very dark place. You can feel a slight draft and can tell that there is a fork in your path. you can push forward in a northerly direction or cut east", {:north => :stairway, :east => :deathpit, :south => :shadow_hall})
malistan.add_room(:stairway, "The Winding stairway", "winding staircase. You can see the faint flicker of a candle just around the bend... but you can never seem to catch it.",{:north => :empty_chamber, :south => :darkness})
malistan.add_room(:empty_chamber, "the Empty Chamber", "an empty room. A single candle burns on the mantle of a long cold fireplace. There is a door in every direction. Things may start to get interesting", {:south => :stairway, :north => :cave_mouth, :west => :sweet_tooth, :east => :grinder})
malistan.add_room(:deathpit, "Deathpit", "a dark place. The draft is stronger... heavier... hotter... smells of rotting meat. Turn back before it is too la--",{:resurrect => :cave_mouth})
#Start

puts "Welcome Adventurer!\n"

puts "What is your name?"

malistan.player.name = gets.chomp

puts %Q{
	===============================================
	#{malistan.player.name} : #{malistan.player.hp}hp : #{malistan.player.mana}mp
	===============================================
}

malistan.start(:cave_mouth)

loop do 

	puts "Which direction would you like to go?"

	direction = gets.chomp.downcase.to_sym

	if malistan.find_room_in_direction(direction).to_s != ""

		malistan.go(direction.to_sym)

	elsif direction == :exit
		
		puts "Exiting"
		break

	else
		puts "I'm sorry. That is not a valid command."
		next
	end

	break if direction == "exit"


	if malistan.player.location == :deathpit
		malistan.player.hit_by_monster(1000)
		break
	end

end