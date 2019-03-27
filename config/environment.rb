require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Song.new(name).tap {|s| s.save}
  end

  def save
    @@all << self
  end
end

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Artist.new(name).tap {|s| s.save}
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if !song.artist
  end
end

class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Genre.new(name).tap {|s| s.save}
  end

  def save
    @@all << self
  end
end
