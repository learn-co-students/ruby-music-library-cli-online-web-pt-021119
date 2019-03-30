require 'pry'

class Genre
  attr_accessor :name, :songs 
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
  
  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    self.artist << song.artist unless artist.songs.include?(song)
    song.genre = self if song.genre.nil?
  end 
  
  def artists 
    artists = self.songs.collect{|song| song.artist}.uniq
  end 
  
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(name)
    Genre.new(name).tap{|genre_name| genre_name.save}
  end 
    
  
end 