require_relative "./concerns"

class Genre
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

end
