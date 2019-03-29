class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new(name).tap {|s| s.save}
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end

  def self.new_from_filename(filename)
      song = filename.split(" - ")[1]
      artist_name = filename.split(" - ")[0]
      genre_name = filename.split(" - ")[2].gsub(".mp3", "")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      new(song, artist, genre)
  end

  def self.create_from_filename(filename)
      new_from_filename(filename).tap{ |s| s.save }
  end

end
