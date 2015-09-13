#Dungeon Explorer

class Dungeon
	attr_accessor :player
	
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	class Player
		def initialize(name, location)
			@name = name
			@location = location
		end
	end

	class Room
		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
	end

	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)

	end

end

#malistan = Dungeon.new("Charlotte Dogs")

#malistan.add_room(:cave_mouth, "Mouth of Cave", "the mouth of a cave", { :south => :field, :north => :first_chamber})
#malistan.add_room(:first_chamber, "First Chamber", "a damp chamber in the cave", {:south => :cave_mouth, :north => :shadow_hall})
	

