class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end

  def files
    #binding.pry
    Dir.glob("#{path}/*.mp3").collect { |fajl| fajl.gsub("#{path}/", "")}
  end
  
  def import
    files.each { |file| Song.create_from_filename(file) }
  end







end