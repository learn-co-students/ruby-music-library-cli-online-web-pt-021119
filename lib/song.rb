# require_relative "./concerns"
# require "pry"

class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil)
    self.name = name
    @artist = artist
  end

  def self.all
    @@all
  end

end

# puts song = Song.new("Allison")
# binding.pry
