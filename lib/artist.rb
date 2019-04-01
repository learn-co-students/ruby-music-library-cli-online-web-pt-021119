require_relative "./concerns/findable.rb"

class Artist  
  
  extend Concerns::Findable 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.destroy_all
    self.all.clear 
  end 
  
  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end 
  
  def songs 
    @songs 
  end 
  
  def add_song(song)
    song.artist=(self) unless song.artist.class == Artist
    self.songs << song unless self.songs.include?(song)
  end 
  
  def genres 
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end 
    genres.uniq
  end 
  

end 