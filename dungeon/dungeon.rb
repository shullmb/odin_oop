#Dungeon Explorer

class Dungeon
	attr_accessor :player
	
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	def player(name, location)

	end

	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)

	end

	Player = Struct.new(:name, :location)
	Room = Struct.new(:reference, :name, :description, :connections)
end

malistan = Dungeon.new("Charlotte Dogs")

malistan.add_room(:cave_mouth, "Mouth of Cave", "the mouth of a cave", { :south => :field, :north => :first_chamber})
malistan.add_room(:first_chamber, "First Chamber", "a damp chamber in the cave", {:south => :cave_mouth, :north => :shadow_hall})


