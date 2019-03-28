require_relative '../config/environment.rb'

class MusicLibraryController

    def initialize(path="./db/mp3s")
        importer=MusicImporter.new(path)
        importer.import            
    end

    def call
        answer=''
        while answer!='exit'
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            answer = gets.chomp

            case answer
            when 'list songs'
                list_songs
            when 'list artists'
                list_artists
            when 'list genres'
                list_genres
            when 'list artist'
                list_songs_by_artist
            when 'list genre'
                list_songs_by_genre
            when 'play song'
                play_song
            end
        end   
    end     
    
    def list_songs
        # binding.pry 
        Song.all.sort_by(&:name).each_with_index{|song,i|puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
        Artist.all.sort_by(&:name).each_with_index{|artist,i|puts "#{i+1}. #{artist.name}"}
    end

    def list_genres
        Genre.all.sort_by(&:name).each_with_index{|genre,i|puts "#{i+1}. #{genre.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist=gets.chomp
        Artist.find_by_name(artist).songs.sort_by(&:name).each_with_index{|song,i|puts "#{i+1}. #{song.name} - #{song.genre.name}"} if Artist.find_by_name(artist)
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre=gets.chomp
        Genre.find_by_name(genre).songs.sort_by(&:name).each_with_index{|song,i|puts "#{i+1}. #{song.artist.name} - #{song.name}"} if Genre.find_by_name(genre)    
    end

    def play_song
        puts "Which song number would you like to play?"
        song_number=gets.chomp.to_i
        songs = Song.all.sort_by(&:name)
        # binding.pry
        puts "Playing #{songs[song_number-1].name} by #{songs[song_number-1].artist.name}" if song_number>0 && song_number<songs.size
    end

end