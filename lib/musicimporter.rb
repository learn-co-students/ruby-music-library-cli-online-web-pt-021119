class MusicImporter
  attr_accessor :path
  @@songs = []

  def initialize(path)
    @path = path
  end

  def files
    @@songs = Dir.glob(path + "/**.mp3")
    @@songs = @@songs.collect do |song|
      *garbage, content = song.split('/')
      song = content
    end
  end

  def import
    @@songs.each do |song|
      Song.create_from_filename(song)
    end
  end

end
