class Genre

extend Concerns::Findable

attr_accessor :name, :songs

def initialize(name)
@name = name
@songs = []
end

@@all = []

def self.all
@@all
end

def save
@@all << self
end

def self.destroy_all
  @@all = []
end

def self.create(name)
  genre = self.new(name)
  genre.save
  genre
end

def artists
artists = @songs.collect do |song|
  song.artist
end
artists.uniq
end

end
