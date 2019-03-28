require_relative '../config/environment.rb'
require 'pry-byebug'

class Song
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist,:genre

    @@all = []

    def initialize (name,artist=nil,genre=nil)
        # binding.pry
        @name = name
        # binding.pry if artist!=nil
        self.artist=artist if artist!=nil
        self.genre=genre if genre!=nil
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
        song=self.new(name)        
        song.save
        song
    end

    def artist=(artist)
        @artist=artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre=genre
        genre.songs<<self if !genre.songs.include?(self)
    end

    def self.new_from_filename (filename)
        music = filename.gsub(".mp3","").split(" - ")
        # byebug
        song=find_or_create_by_name(music[1])
        song.artist=Artist.find_or_create_by_name(music[0])
        song.genre=Genre.find_or_create_by_name(music[2])
        song
        # byebug
    end

    def self.create_from_filename (filename)
        new_from_filename(filename)
    end

end