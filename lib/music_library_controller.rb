class MusicLibraryController 
  attr_accessor :path, :importer 
  
  def initialize(path ="./db/mp3s")
    @path= path
    @importer=(MusicImporter.new(path)).import
    end 
    def call 
      input= " "
      puts "Welcome to your music library!" 
      puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?" 
     while input != "exit"
      input=gets.strip
      case input  
       when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
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
