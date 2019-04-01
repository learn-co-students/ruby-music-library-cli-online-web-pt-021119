require 'pry'

class MusicLibraryController 
  
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(@path).import  
  end 
  
  def call 
    input = " "
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip  
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
    sorted_songs = Song.all.sort { |x, y| x.name <=> y.name }
    counter = 1 
    sorted_songs.uniq.each { |song| 
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1 
    }
  end 
  
  
  def list_artists
    artist_names = []
    Artist.all.each { |artist| artist_names << artist.name }
    counter = 0 
    artist_names.sort.each { |artist_name| 
      counter += 1 
      puts "#{counter}. #{artist_name}" 
    }
  end 
  
  
  def list_genres
    genre_names = []
    Genre.all.each { |genre| genre_names << genre.name }
    counter = 0 
    genre_names.sort.each { |genre_name| 
      counter += 1 
      puts "#{counter}. #{genre_name}" 
    }  
  end 
  
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip 
    
    sorted_songs = Song.all.sort { |x, y| x.name <=> y.name }
    sorted_songs_by_artist = [] 
    sorted_songs.each { |song| 
      if song.artist.name == artist 
        sorted_songs_by_artist << song
      end
    }
  
    counter = 1 
    sorted_songs_by_artist.uniq.each { |song| 
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1 
    }
    
  end 
  
  
  def list_songs_by_genre
    
    puts "Please enter the name of a genre:"
    genre = gets.strip 
    
    sorted_songs = Song.all.sort { |x, y| x.name <=> y.name }
    sorted_songs_by_genre = [] 
    sorted_songs.each { |song| 
      if song.genre.name == genre 
        sorted_songs_by_genre << song
      end
    }
  
    counter = 1 
    sorted_songs_by_genre.uniq.each { |song| 
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1 
    }
    
  end 
  
  
  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i 
    
    sorted_songs = Song.all.sort { |x, y| x.name <=> y.name }.uniq
    chosen_song = sorted_songs[song_number - 1]
    
    if song_number > 0 && song_number < sorted_songs.length 
      puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
    end 
    
    
  end 
  
    
  
  
  
  
  
  
  
  
  
  
  




end 