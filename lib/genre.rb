class Genre
  attr_accessor :name, :songs
  attr_reader :artists

  @@all = []
  @@artists = []

  def initialize(name, artist = nil)
    @name = name
    @songs = []
    @@artists << artist unless artist.nil?
    @@all << self
  end

  def artists
    artist_list = []
    self.songs.each do |song|
      if song.genre == self
        artist_list << song.artist
      end
    end
    @@artists = artist_list.uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
  end
end
