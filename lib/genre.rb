class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs


  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    songs.collect {|s| s.artist}.uniq
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre= self if song.genre == nil
    self.songs << song unless self.songs.include?(song)
  end
end
