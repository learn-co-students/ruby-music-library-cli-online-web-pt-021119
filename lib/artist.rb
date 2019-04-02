require 'pry'

class Artist
	# can refactor initialize, create, all, and save into Concerns

	attr_accessor :name, :songs

	@@all = []

	extend Concerns::Findable

	#initialize can be part of a module
	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def self.create(name)
		artist = Artist.new(name)
		artist.save
		artist
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self
	end

	def add_song(song)
		#binding.pry
		@songs << song unless @songs.include?(song)
		song.artist = self unless song.artist
	end

	def genres
		@songs.collect {|song| song.genre}.uniq
		#binding.pry
	end

end