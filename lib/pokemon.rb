require 'pry'

class Pokemon
	attr_reader :id, :name, :type, :db, :hp
	def initialize(id:, name:, type:, hp:60, db:)
		@id = id
		@name = name
		@type = type
		@hp = hp
		@db = db
	end

	def self.save(name,type,db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id,db)
		new_poke = db.execute("SELECT * FROM pokemon")[0]
		Pokemon.new(id: new_poke[0],name: new_poke[1],type: new_poke[2], hp: new_poke[3], db: db)
	end

	def alter_hp(hp,db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp,@id)
	end
end
