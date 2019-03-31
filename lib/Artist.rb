class Artist 
  
extend Concerns::Findable

  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name 
  @songs = []
  end  
   @@all = []
  
  def self.all
    @@all
  end 
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self 
  end 
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end 
  
  def add_song(song)
    song.artist = self if song.artist == nil 
    @songs << song unless @songs.include?(song)
    
 end   
 def genres
  genres = @songs.collect do |song|
    song.genre 
 end
 genres.uniq
 end 
    
end 