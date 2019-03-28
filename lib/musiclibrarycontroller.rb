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

  def list_songs # wtf is with the expected test outputs!?
    @library.sort.reverse.each_with_index do |song, index|
      puts "#{(index + 1).to_s}. #{song.chomp('.mp3')}"
    end
  end

  def list_artists
  end

  def list_genres
  end

  def list_songs_by_artist(artist)
  end

  def list_songs_by_genre(genre)
  end

  def play_song
  end

  def call
    welcome
    input = gets.chomp
    while input != "exit"
      input = gets.chomp
    end
  end

end

# Original Loop

# input = nil
# start_loop = case input
# when "list songs"
#   list_songs
#   input = get_input
#   start_loop
# when "list artists"
#   list_artists
#   input = get_input
#   start_loop
# when "list genres"
#   list_genres
#   input = get_input
#   start_loop
# when "play song"
#   play_song
# else
#   welcome
#   input = get_input
#   start_loop
# end
