class Artist
  extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def genres
    songs.collect { |n| n.genre }.uniq
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
    name = self.new(name)
    name.save
    name
  end
  
  def add_song(song)
    song.artist= self if song.artist == nil
    self.songs << song unless self.songs.include?(song)
  end
  
  
  
end