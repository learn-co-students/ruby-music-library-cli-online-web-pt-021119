require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist = artist unless artist == nil
    @@all << self
  end

  def artist=(artist)
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
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
