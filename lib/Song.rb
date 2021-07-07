class Song

attr_accessor :name, :artist, :genre

def initialize(name, artist = nil, genre = nil)
@name = name
self.artist=(artist)
self.genre=(genre)
end

@@all = []

def artist=(artist)
@artist = artist
artist.add_song(self) unless artist.nil?
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.nil? || genre.songs.include?(self)
end

def self.all
@@all
end

def self.destroy_all
  @@all = []
end

def save
@@all << self
end

def self.create(song_name)
  song = self.new(song_name)
  song.save
  song
end

def self.find_by_name(song_name)
@@all.find do |song|
  song.name == song_name
end
end

def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create(song_name)
end

def self.new_from_filename(file_name)
  file_bits = file_name.gsub(/(\.mp3)/,'')
    file_bits = file_bits.split(" - ")
    artist = Artist.find_or_create_by_name(file_bits[0])
    genre = Genre.find_or_create_by_name(file_bits[2])
    song = Song.find_or_create_by_name(file_bits[1])
    song.genre = genre
    song.artist = artist
    song
end

def self.create_from_filename(file_name)
new_from_filename(file_name).tap {|song| song.save}
end

end
