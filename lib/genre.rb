class Genre 
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods 
  extend Concerns::Findable
   attr_accessor :name, :songs 
   
   @@all=[]
  
  def initialize(name)
    @name=name 
    @songs=[]
  end 
  def self.all 
    @@all 
  end 
  def artists
    self.songs.collect{ |song|
      song.artist}.uniq
      
    end 
  
  
end 