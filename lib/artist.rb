require_relative "../config/environment.rb"

class Artist
  extend Concerns::Findable
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
    all.clear
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
    songs << song if !songs.include?(song)
  end

  def genres
    songs.collect {|s| s.genre}.uniq
  end
end
