class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    library = MusicImporter.new(@path)
    library.import
    # binding.pry
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

  def get_input
    gets.chomp
  end

  # def list_songs
  # end
  #
  # def list_artists
  # end
  #
  # def list_genres
  # end
  #
  # def play_song
  # end

  def call
    welcome
    input = get_input
    while input != "exit"
      input = get_input
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
