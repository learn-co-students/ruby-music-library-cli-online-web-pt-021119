class MusicImporter
  attr_accessor :path, :songs
  @@songs = []

  def initialize(path)
    @path = path
  end

  def songs
    @@songs
  end

  def files
    @@songs = Dir.glob(path + "/**.mp3")
    @@songs = @@songs.collect do |song|
      *garbage, content = song.split('/')
      song = content
    end

    # Song array needs to be alphabetized by song name
    hash = {}
    self.songs.each do |song|
      artist_name, song_name, genre_name = song.split(' - ')
      hash[song] = [artist_name,song_name,genre_name]
    end
    arrays = hash.values.sort_by { |key,value| value }

    @@songs = @@songs.collect.each_with_index do |song, song_index|
      arrays.each_with_index do |array_song, array_index|
        if song_index == array_index
          song = array_song.join(" - ")
        end
      end
    end

    @@songs = @@songs.uniq.first
    @@songs = @@songs.collect do |song|
      song.join(" - ")
    end
  end

  def import
    self.files.each do |song|
      Song.create_from_filename(song)
    end
  end

end
