require 'pry'

class Artist
  attr_accessor :name, :songs 
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def add_song(song)
    song.artist = self if song.artist.nil? 
    @songs << song unless @songs.include?(song)
  end 
  
  def genres
    genres = self.songs.collect{|song| song.genre}.uniq 
  end  
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(name)
    Artist.new(name).tap{|artist_name| artist_name.save}
  end 
    
  
end 