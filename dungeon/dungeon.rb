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
		attr_accessor :name, :location
		def initialize(name)
			@name = name
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
			@name + "\n\nYou are in " + @description
		end
	end

end

#Create Dungeon Instance
malistan = Dungeon.new("Charlotte Dogs")

#Add rooms
malistan.add_room(:cave_mouth, "Mouth of Cave", "the mouth of a cave", { :south => :field, :north => :first_chamber})
malistan.add_room(:first_chamber, "First Chamber", "a damp chamber in the cave", {:south => :cave_mouth, :north => :shadow_hall})

#Start

malistan.start(:cave_mouth)	

