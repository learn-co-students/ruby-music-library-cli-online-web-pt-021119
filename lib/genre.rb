require_relative "./concerns/findable.rb"

class Genre 
  
  extend Concerns::Findable 
  
  attr_accessor :name, :songs  
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.destroy_all
    self.all.clear 
  end 
  
  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end 
  
  def artists 
    @songs.collect { |s| s.artist}.uniq
  end 

end 