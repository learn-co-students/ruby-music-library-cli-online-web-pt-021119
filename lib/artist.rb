require 'pry'

class Artist

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

    def add_song(song)
        song.artist || song.artist = self
        @songs.push(song) unless @songs.include?(song)
        # binding.pry
    end

    def self.create(name)
        artist = Artist.new(name) 
        artist.save
        artist
    end

    def genres
        genres
    end

end
