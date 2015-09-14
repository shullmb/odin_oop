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

		def hit(damage)
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
			@name + "\n\nYou are in #{@description}.\n"
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

	puts "Which direction?"

	direction = gets.chomp

	break if direction == "exit"

	malistan.go(direction.to_sym)

	if malistan.player.location == :deathpit
		malistan.player.hit(1000)
		break
	end

end