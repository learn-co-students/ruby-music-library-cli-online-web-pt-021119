class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.genre = genre
    self.artist = artist
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) unless self.artist.nil?
  end

  def genre=(genre)
    @genre = genre
    if !self.genre.nil?
      @genre.songs << self unless self.genre.songs.include?(self)
    end
  end

  def self.all
    @@all
  end

end

# puts song = Song.new("Allison")
# binding.pry
