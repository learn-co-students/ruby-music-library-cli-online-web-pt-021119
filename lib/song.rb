require 'pry'

class Song

    @@all = []

    attr_accessor :name
    attr_reader :genre, :artist

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
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

    def genre=(genre)
        @genre = genre
        genre.songs.push(self) unless genre.songs.include? (self) 
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def self.find_by_name(name)
        @@all.detect{|a| a.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
        artist_, song_, genre_ = filename.split(" - ")
        song_artist = Artist.find_or_create_by_name(artist_)
        song_genre = Genre.find_or_create_by_name(genre_.split(".")[0])
        new_song = Song.new(song_, song_artist, song_genre)
        new_song
        # binding.pry
    end

    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save
    end

end
