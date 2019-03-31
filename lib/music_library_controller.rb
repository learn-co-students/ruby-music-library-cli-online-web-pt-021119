require 'pry'

class MusicLibraryController

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    until user_input == "exit"
      puts "What would you like to do?"
      user_input = gets.strip
      if user_input == 'list songs'
        list_songs
      elsif user_input == 'list artists'
        list_artists
      elsif user_input == 'list genres'
        list_genres
      elsif user_input == 'list artist'
        list_songs_by_artist
      elsif user_input == 'list genre'
        list_songs_by_genre
      elsif user_input == 'play song'
        play_song
      end
    end

  end

  def list_songs
    Song.all.sort_by {|song| song.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    user_input = ""
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
      artist.songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    user_input = ""
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      genre.songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    input = ""
    puts "Which song number would you like to play?"
    input = gets.strip
    if input.to_i > 0 && input.to_i <= Song.all.size
      song = Song.all.sort_by {|song| song.name}
      puts "Playing #{song[input.to_i-1].name} by #{song[input.to_i-1].artist.name}"
    end
  end

end
