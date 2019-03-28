class MusicLibraryController
  attr_accessor :path, :library

  def initialize(path = './db/mp3s')
    @path = path
    library = MusicImporter.new(@path)
    @library = library.import
  end

  def welcome
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def call
    welcome
    input = gets.chomp
    list_songs if input == "list songs"
    list_artists if input == "list artists"
    list_genres if input == "list genres"
    list_songs_by_artist if input == "list artist"
    list_songs_by_genre if input == "list genre"
    play_song if input == "play song"
    while input != "exit"
      binding.pry
      input = gets.chomp
    end
  end

  def list_songs
    songs = Song.all.sort_by {|song| song.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort_by {|artist| artist.name}
    artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    songs = []
    Song.all.each do |song|
      if song.artist.name == artist
        songs << song
      end
    end
    songs = songs.sort_by {|song| song.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    songs = []
    Song.all.each do |song|
      if song.genre.name == genre
        songs << song
      end
    end
    songs = songs.sort_by {|song| song.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.chomp
    songs = Song.all.sort_by {|song| song.name}
    songs.each_with_index do |song, index|
      if (index + 1) == number.to_i
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
