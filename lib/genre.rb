class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).save
    self
  end

  def self.destroy_all
    @@all = []
  end

end
