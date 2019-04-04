require 'pry'

class Artist

	attr_accessor :name, :songs

	@@all = []

	extend Concerns::Findable
	include Concerns::InstanceMethods

	def self.all
		@@all
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