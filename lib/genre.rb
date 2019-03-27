class Genre
  attr_accessor :name, :songs
  attr_reader :artists

  extend Concerns::Findable

  @@all = []
  @@artists = []

  def initialize(name, artist = nil)
    @name = name
    @songs = []
    @@artists << artist unless artist.nil?
    @@all << self
  end

  # This can be moved into an included module
  def save
    @@all << self
    @@all = @@all.uniq
  end

  # Instance Methods
  def artists
    artist_list = []
    self.songs.each do |song|
      if song.genre == self
        artist_list << song.artist
      end
    end
    @@artists = artist_list.uniq
  end

  # Class Methods
  def self.all
    @@all
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
