class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{@path}/*.mp3").collect {|f| f.split("mp3s/")[1]}
  end

  def import
    files.each {|f| Song.create_from_filename(f)}
  end
end
