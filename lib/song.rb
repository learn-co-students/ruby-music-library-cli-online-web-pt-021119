require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

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

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    if self.find_by_name(name).nil?
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
end
