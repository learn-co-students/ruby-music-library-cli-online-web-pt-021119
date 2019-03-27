require "pry"
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(self.path).select {|f| !File.directory?(f)}
  end

  def import
    self.files.each {|file_name| Song.create_from_filename(file_name)}
  end
end
