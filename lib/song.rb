class Song

	attr_accessor :name, :artist, :genre

	@@all = []

	extend Concerns::Findable

	# can refactor initialize, create, all, and save into Concerns

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist unless artist == nil
		self.genre = genre unless genre == nil
		#@artist = artist
	end

	def self.all
		@@all
	end

	def self.create(name)
		song = Song.new(name)
		song.save
		song
	end

	def self.destroy_all
		@@all.clear
	end

	# Mixed in from Findable module
	#def self.find_by_name(name)
	#	@@all.find {|song| song.name == name}
	#end

	#def self.find_or_create_by_name(name)
	#	self.find_by_name(name) || self.create(name)
	#end

	def self.new_from_filename(filename)
		artist, name, genre = filename.split('.mp3').join.split(' - ')
		#binding.pry
		song = self.find_or_create_by_name(name)
		song.artist = Artist.find_or_create_by_name(artist)
		song.genre = Genre.find_or_create_by_name(genre)
		song
	end

	def self.create_from_filename(filename)
		self.new_from_filename(filename)
	end

	def save
		@@all << self
	end

	def artist=(artist)
		@artist = artist unless artist == nil
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		@genre.songs << self unless @genre.songs.include?(self)
	end

end