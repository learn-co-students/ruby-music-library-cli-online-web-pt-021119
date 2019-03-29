class Song 
  attr_accessor :name, :genre, :artist
 
  
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre=(genre)
    self.artist=(artist) 
  end
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) unless artist.nil? 
  end
  def genre=(genre)
    @genre = genre 
    genre.add_song(self) unless genre.nil?
  end
  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end
   def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
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
    self.new(name).tap do |artist|
    artist.save
   end
  end
  def self.new_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end
   def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  
  
end