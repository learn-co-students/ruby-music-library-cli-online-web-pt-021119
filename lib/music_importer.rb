class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
    
  end 


  def files 
    Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{path}/", "")}
  end 
    
    def import
      files.each do |file_name|
      Song.create_from_filename(file_name)
    end 
    end 
end