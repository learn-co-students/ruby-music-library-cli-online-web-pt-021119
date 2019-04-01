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
        self.new(name).tap {|artist| artist.save}
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist ? song.artist : song.artist = self
        if !songs.include?(song)
            songs << song
        end
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end

end