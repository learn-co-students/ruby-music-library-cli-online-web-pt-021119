require 'pry'

class MusicLibraryController
  attr_accessor :music

  def initialize(path='./db/mp3s')
    @music = MusicImporter.new(path).import
  end

  def call
    input = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp!
  end

  def list_songs
    songs = music.collect {|x| x.chomp(".mp3")}
    songs.collect! {|x| x.split(" - ")}
    songs_hash = songs.collect do |x|
      {:artist => x[0], :song => x[1], :genre => x[2]}
    end
    songs_hash.sort_by! {|hash| hash[:song]}
    songs_sorted = songs_hash.collect do |x|
      [x[:artist], x[:song], x[:genre]]
    end
    songs_sorted.each_with_index do |x, index|
      puts "#{index+1}. #{x.join(" - ")}"
    end
  end

  def list_artists
    artists = music.collect {|x| x.chomp(".mp3")}
    artists.collect! {|x| x.split(" - ")}
    artists_hash = artists.collect do |x|
      {:artist => x[0], :song => x[1], :genre => x[2]}
    end
    artists_hash.sort_by! {|hash| hash[:artist]}
    artists_sorted = artists_hash.collect do |x|
      [x[:artist], x[:song], x[:genre]]
    end
    artist_array = artists_sorted.collect {|x| x[0]}.uniq!
    artist_array.each_with_index do |x, index|
      puts "#{index+1}. #{x}"
    end
  end

end
