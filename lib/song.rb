require "pry"

class Song
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.genre = genre
    self.artist = artist
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) unless self.artist.nil?
  end

  def genre=(genre)
    @genre = genre
    if !self.genre.nil?
      @genre.songs << self unless self.genre.songs.include?(self)
    end
  end

  def self.new_from_filename(filename)
    splitted = filename.split(" - ")
    song_name = splitted[1]
    artist_name = splitted[0]
    genre_name = splitted[2].split(".")[0]

    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.all
    @@all
  end

end

# puts song = Song.new("Allison")
# binding.pry
