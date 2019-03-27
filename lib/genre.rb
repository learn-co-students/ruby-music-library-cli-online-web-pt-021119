require_relative "./concerns"

class Genre
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
  end

  def self.all
    @@all
  end

end
