class Genre
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
        # genre = new(name)
        # genre.save
        # genre
    end

    def add_song(song)
        song.genre ? song.genre : song.genre = self
        if !songs.include?(song)
            songs << song
        end
    end

    def artists
        songs.collect do |song|
            song.artist
        end
        .uniq
    end

end