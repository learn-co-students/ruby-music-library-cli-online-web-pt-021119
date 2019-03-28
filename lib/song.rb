class Song
  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
    @@all << self
  end

  # This can be moved into an included module
  def save
    @@all << self
    @@all = @@all.uniq
  end

  # Instance Methods
  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self) || artist.nil?
    @artist = artist
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self) || genre.nil?
    @genre = genre
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    genre_name = genre_name.split(".mp3")[0]
    genre = Genre.find_or_create_by_name(genre_name)
    artist = Artist.find_or_create_by_name(artist_name)
    new_instance = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

end
