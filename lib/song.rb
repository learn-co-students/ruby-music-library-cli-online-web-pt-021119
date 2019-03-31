require 'pry'
class Song

attr_accessor :name
attr_reader :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist
  self.genre = genre if genre
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self if !genre.songs.include?(self)
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end

def self.find_by_name(name)
  all.find {|x| x.name == name}
  #searches through @@all, x is the variable placeholder, x.name is what is being found, x.name has to be idential to name and return True
end

def self.find_or_create_by_name(name)
  find_by_name(name) || create(name)
  #NOTE the methods were already created to carry out the functions needed
  #reminder: self is implied on the method and does not need to be written
  #the pipes operator means (or)
  #if the left side is true song is found or song is created
end

def self.new_from_filename(filename)
  parts = filename.split(" - ")
  artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  #NOTE the find_or_create_by_name does not allow for duplicates
  new(song_name, artist, genre)
end

def self.create_from_filename(filename)
  new_from_filename(filename).tap {|song| song.save}
end


end
