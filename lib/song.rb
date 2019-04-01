require 'pry'

class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre   
  
  @@all = []
  
  def initialize(name, artist = "none", genre = "none")
    @name = name
    self.artist = artist  unless artist == "none"
    self.genre = genre unless genre == "none"
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
  
  def artist=(artist)
    @artist = artist unless self.artist.class == Artist 
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
  def genre=(genre)
    @genre = genre unless self.genre.class == Genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
    
  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name) 
    if find_by_name(name)
      find_by_name(name)
    else 
      create(name)
    end 
  end 
  
  def self.new_from_filename(filename)
    filename_sans_mp3 = filename[0..-5]
    filename_elements = filename_sans_mp3.split(" - ")
    song = find_or_create_by_name(filename_elements[1])
    artist = Artist.find_or_create_by_name(filename_elements[0])
    song.artist = artist
    genre = Genre.find_or_create_by_name(filename_elements[2])
    song.genre = genre
    song 
  end 
  
  def self.create_from_filename(filename) 
    new_from_filename(filename).save
  end 
  
  
    
    
    
    
  

end 