require_relative "./concerns"
require "pry"

class Artist
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    if !song.artist.nil? && !self.songs.include?(song)
      self.songs << song
    end
  end

  # def genres
  #   binding.pry
  #   self.songs.collect {|song| song.genre.name}
  # end

  def self.all
    @@all
  end

end
