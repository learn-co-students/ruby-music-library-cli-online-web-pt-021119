require 'pry'

class MusicImporter
  attr_accessor :files, :path 
  
  def initialize(path)
    @path = path
  end
  
  def files 
    Dir.glob("#{path}/*").collect do |file| 
      file.gsub("#{path}/", "")
    end 
  end 
  
  def import
    files.each{|file| Song.create_from_filename(file)}
  end
  
end 