require_relative '../config/environment.rb'


class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs

    @@all = []

    def initialize (name)
        @name = name
        @songs=[]
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all<<self
    end

    def self.create(name)
        genre=self.new(name)        
        genre.save
        genre
    end

    def artists
        songs.map{|song|song.artist}.uniq
    end


end