require_relative "./concerns"
class Artist 
  
 include Concerns::InstanceMethods
  extend Concerns::ClassMethods 
 extend Concerns::Findable
  attr_accessor :name, :songs

  @@all= []
 
 def initialize(name)
 @name=name 
  @songs=[]
end 
def self.all 
  @@all 
end 
   def genres
   self.songs.collect {|song| song.genre}.uniq
  end
  def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist=self unless song.artist == self 
    end 
  
end 