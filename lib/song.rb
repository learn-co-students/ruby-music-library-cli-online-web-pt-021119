require_relative "./concerns"
require "pry"
class Song 
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods 
  extend Concerns::Findable
  
  attr_accessor :name 
  attr_reader :artist, :genre 
  @@all= []
  
  def initialize(name, artist=nil, genre=nil)
    @name=name 
    self.artist=artist if artist
    self.genre=genre if genre
    
  end 
  def artist=(artist)
    @artist=artist
   artist.add_song(self) 
    
  end 
  
  def genre=(genre)
   @genre = genre
   genre.songs << self unless genre.songs.include?(self)
   
  end 
  
  def self.all 
    @@all 
  end 
  def self.new_from_filename(filename)
  names= filename.split(" - ")
  song_name,artist_name, genre_name= names[1],names[0], names[2].split(".")[0]
     song=self.find_or_create_by_name(song_name)
    song.artist=Artist.find_or_create_by_name(artist_name)
    song.genre=Genre.find_or_create_by_name(genre_name)
    song 
    end 
    def self.create_from_filename(filename)
      self.all << self.new_from_filename(filename)
    end 
end 