require_relative "../config/environment.rb"

class Genre
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def self.create(name)
    Genre.new(name).tap {|s| s.save}
  end

  def artists
    songs.collect {|s| s.artist}.uniq
  end
end
