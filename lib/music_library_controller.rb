require "pry"

class MusicLibraryController
  attr_accessor :path, :importer

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
  end

  def list_artists
    artist_names = Artist.all.collect{|artist| artist.name}.uniq.sort!
    artist_names.each.with_index(1) {|artist_name, index| puts "#{index}. #{artist_name}"}
  end

  def list_genres
    genre_names = Genre.all.collect{|genre| genre.name}.uniq.sort!
    genre_names.each.with_index(1) {|genre_name, index| puts "#{index}. #{genre_name}"}
  end
end
