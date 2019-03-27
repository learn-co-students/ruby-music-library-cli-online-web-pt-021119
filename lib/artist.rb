require 'pry'

class Artist
  attr_accessor :name, :songs
  attr_reader :genres

  @@all = []
  @@genres = []

  def initialize(name, genre = nil)
    @name = name
    @songs = []
    @@genres << genre unless genre.nil?
    @@all << self
  end

  # This can be moved into an included module
  def save
    @@all << self
  end

  #Instance Methods
  def genres
    genre_list = []
    self.songs.each do |song|
      if song.artist == self
        genre_list << song.genre
      end
    end
    @@genres = genre_list.uniq
  end

  def add_song(song)
    self.songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
    song
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
  end
end
