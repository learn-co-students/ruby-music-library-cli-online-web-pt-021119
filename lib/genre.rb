class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end


  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

end
