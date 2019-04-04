class Genre

	attr_accessor :name, :songs

	@@all = []

	extend Concerns::Findable
	include Concerns::InstanceMethods

	def self.all
		@@all
	end

	def artists
		@songs.collect {|song| song.artist}.uniq
	end

end