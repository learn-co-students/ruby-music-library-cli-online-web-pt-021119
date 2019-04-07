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
    # binding.pry 
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(sname)
    all.find { |song| song.name == sname }
  end
  
  def self.find_or_create_by_name(sname)
    find_by_name(sname) || create(sname)
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).tap { |song| song.save }
  end
  
end