require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(path)
    files.select { |x| x if x.end_with?('.mp3')}
  end

  def import
    files.each { |file| Song.create_from_filename(file) }
  end

end
