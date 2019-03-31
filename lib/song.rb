require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    artist_name, song_name, genre_name = names[0], names[1], names[2].chomp(".mp3")
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(song_name, new_artist, new_genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
