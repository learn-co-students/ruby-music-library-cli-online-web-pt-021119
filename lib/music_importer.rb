require 'pry'

class MusicImporter
  attr_accessor :path
 def initialize(path)
 @path = path 
 
 end
  
  def path
    @path
    #binding.pry
  end
  
  def files
 files= Dir.glob("#{path}/*").collect  {|file| file.gsub("#{path}/","")}
  #binding.pry
  end
end
