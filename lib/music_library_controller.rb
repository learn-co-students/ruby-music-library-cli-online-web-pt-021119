require "pry"

class MusicLibraryController
  attr_accessor :path, :importer, :files

  def initialize(path = "./db/mp3s")
    @path = path
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp
    end
  end

  def list_songs
    files = self.importer.files.collect{|file_name| file_name.gsub(".mp3", "")}
    files.sort_by!{|file_name| file_name.split(" - ")[1]}
    files.each.with_index(1) {|file, index| puts "#{index}. #{file}"}
    @files = files
  end

  def list_artists
    artist_names = Artist.all.collect{|artist| artist.name}.uniq.sort!
    artist_names.each.with_index(1) {|artist_name, index| puts "#{index}. #{artist_name}"}
  end

  def list_genres
    genre_names = Genre.all.collect{|genre| genre.name}.uniq.sort!
    genre_names.each.with_index(1) {|genre_name, index| puts "#{index}. #{genre_name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    if (artist = Artist.find_by_name(artist_name))
      sorted_songs = artist.songs.sort_by {|song| song.name}
      sorted_songs.uniq.each.with_index(1) {|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    if genre = Genre.find_by_name(genre_name)
      sorted_songs = genre.songs.sort_by{|song| song.name} #songs sorted by song names
      sorted_songs.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    song_names = self.list_songs
    if song_number > 0 && song_number <= song_names.size
      song_name = song_names.split(" - ")[1]
      artist_name = song_names.split(" - ")[0]
      "Playing #{song_name} by #{artist_name}"
      binding.pry
    end
  end
end
