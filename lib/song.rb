class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize (name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    self.genre= (genre) unless genre.nil?
  end

  def genre=(genre)
    @genre = genre #=> instance of Genre genre.songs (array)
    genre.songs << self unless genre.songs.include?(self)
    genre
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
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create(name)
  end
end
