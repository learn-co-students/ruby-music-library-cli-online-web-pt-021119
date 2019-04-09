require 'pry'
class Song 
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    @songs = []
    self.artist = artist if artist
    self.genre = genre if genre
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
    new(name).save.last
  end
  #how is this method collabarting with the artist class method?
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end    
  
  def genre=(genre)
    @genre = genre
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end
  

end