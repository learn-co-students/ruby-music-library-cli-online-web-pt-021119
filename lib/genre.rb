class Genre

	attr_accessor :name, :songs

	@@all = []

	extend Concerns::Findable

	# can refactor initialize, create, all, and save into Concerns

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def self.create(name)
		genre = Genre.new(name)
		genre.save
		genre
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self
	end

	def artists
		@songs.collect {|song| song.artist}.uniq
	end

end