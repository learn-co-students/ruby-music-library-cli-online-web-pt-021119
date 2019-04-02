require_relative './concerns.rb'

class Genre

    extend Concerns::Findable

    @@all = []

    attr_accessor :name, :songs

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def save
        @@all << self
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end

    def artists
        x = @songs.collect {|song| song.artist}
        x.uniq
    end

end

