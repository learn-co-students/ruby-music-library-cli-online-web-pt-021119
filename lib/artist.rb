require "pry"

class Artist

  attr_accessor :name, :songs

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

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name).save
    self
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
