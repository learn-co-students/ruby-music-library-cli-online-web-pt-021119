require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist = file[0]
    song = file[1]
    genre = file[2].split(".")[0]
    Song.new(song,
      Artist.find_or_create_by_name(artist),
      Genre.find_or_create_by_name(genre)) if find_by_name(song).nil?
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
