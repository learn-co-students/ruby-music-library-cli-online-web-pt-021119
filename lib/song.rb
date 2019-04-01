class Song
    attr_accessor :name
    attr_accessor :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        # artist ? self.artist = artist : nil
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
        # @@all = []
    end

    def save
        @@all << self
    end

    def self.create(name)
        self.new(name).tap {|artist| artist.save}
        # song = self.new(name)
        # song.name
        # song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) unless artist.nil?
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self) unless genre.nil?
    end

    def self.find_by_name(name)
        self.all.find {|artist| artist.name == name}
        # artist_found ? artist_found : artist_create
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file)
        # .chomp removes the file extension name
        # .split removes the dashes
        song_name = file.split(" - ")[1]
        artist_name = file.split(" - ")[0]
        genre_name = file.split(" - ")[2].chomp(".mp3")

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        new(song_name, artist, genre)
    end

    def self.create_from_filename(file)
        song = self.new_from_filename(file)
        song.save
    end

end