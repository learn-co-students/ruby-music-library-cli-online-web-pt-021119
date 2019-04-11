require "pry"

class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def genres
    songs.collect { |s| s.genre }.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def self.destroy_all
    @@all = []
  end

  def songs
    @songs
  end

  def add_song(song)
      song.artist= self unless song.artist
      self.songs << song unless self.songs.include?(song)
  end

end
