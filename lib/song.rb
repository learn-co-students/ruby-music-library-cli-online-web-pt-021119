class Song

  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.nil?
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
  end

  def self.new_from_filename(file_name)
    names = file_name.split(" - ")
    artist_name, song_name, genre_name = names[0], names[1], names[2].gsub(".mp3", "")

    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(song_name, new_artist, new_genre)
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).tap { |song| song.save}
  end

end
