class Artist 
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    
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
  
  def songs 
    @songs
  end  
  
  def add_song(song)
  self = song.artist if artist
  end
end 