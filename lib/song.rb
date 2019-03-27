# require_relative "./concerns"
# require "pry"

class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

end

# puts song = Song.new("Allison")
# binding.pry
