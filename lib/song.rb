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

end
