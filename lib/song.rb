require 'pry'
class Song 
  attr_accessor :name, :artist
  @@all = []
  def initialize(name, artist = nil)
    @name = name 
    @songs = []
    self.artist = artist if artist
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
  
end