require 'pry'

class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre 
  end 
  
  def self.all 
    @@all 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) 
  end   
  
  def genre=(genre)
    @genre = genre 
    self.genre.songs << self unless genre.songs.include?(self)
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).tap{|song_name| song_name.save}
  end 
    
  def self.find_by_name(name) 
    @@all.detect{|each_song| each_song.name == name} 
  end 
  
  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end 
  
  def self.new_from_filename(filename)
    components = filename.split(" - ")
    file_artist, file_name, file_genre = components[0], components[1], components[2].gsub(".mp3", "")
    
    artist = Artist.find_or_create_by_name(file_artist)
    genre = Genre.find_or_create_by_name(file_genre)
    
    Song.new(file_name, artist, genre)
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end 