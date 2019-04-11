class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    self.artist=(artist)
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.nil?
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).save
    self
  end

  def self.destroy_all
    @@all = []
  end

  def artist
    @artist
  end

end
