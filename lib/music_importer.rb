class MusicImporter 
  attr_accessor :path, :files
 
  def initialize(path)
  @path=path 
end 

def files 
  @files=Dir.entries(@path).select{|f| !File.directory?(f)}
end 
 def import
    self.files.each {|file_name| Song.create_from_filename(file_name)}
  end
  
end 