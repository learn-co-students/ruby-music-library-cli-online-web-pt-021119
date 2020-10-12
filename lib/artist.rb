class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    songs.collect { |s| s.genre }.uniq
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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist= self if song.artist == nil
    self.songs << song unless self.songs.include?(song)
  end
end
