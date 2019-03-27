require_relative "./concerns"

class Artist
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
      self.songs << self
    end
  end

  def self.all
    @@all
  end

end
