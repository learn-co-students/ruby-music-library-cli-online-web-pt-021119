class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist = self.new(name)
    artist.save
    artist
  end

def add_song(song)
  song.artist = self unless song.artist
  #unless is a keyword, it is the inverse of if, meaning unless false then puts "not" end
  songs << song unless songs.include?(song)
  end

def genres
  songs.collect {|x| x.genre}.uniq
  #uniq gets rid of the duplicates
end



end
