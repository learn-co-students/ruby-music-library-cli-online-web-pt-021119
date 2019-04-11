
require 'pry'
require_relative './concerns.rb'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    Genre.all.select do |genre|
      genre.songs.each {|song| song.artist == self}
    end
  end
end
