class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name

  @@all = []

end

puts song = Song.new("Allison")
