require 'pry'

class MusicLibraryController

    attr_accessor :path

    def initialize(path='./db/mp3s')
        @path = path
        song = MusicImporter.new(path)
        song.import
    end

    def call

        x = ""

        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        
        while x != "exit" do 
            x = gets.strip

            if x == 'list songs'
                list_songs
            elsif x =='list artists'
                list_artists
            elsif x =='list genres'
                list_genres
            elsif x =='list artist'
                list_songs_by_artist
            elsif x =='list genre'
                list_songs_by_genre
            elsif x =='play song'
                play_song
            end

        end



    end
        
    def list_songs
        num = 1
        songs = Song.all.sort{ |a, b| a.name <=> b.name }
        songs.each{ |song| 
            puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            num += 1 
        }

    end

    def list_artists
        num = 1
        artists = Artist.all.sort{ |a, b| a.name <=> b.name }
        artists.each{ |artist| 
            puts "#{num}. #{artist.name}"
            num += 1 
        }
    end

    def list_genres
        num = 1
        genres = Genre.all.sort{ |a, b| a.name <=> b.name }
        genres.each{ |artist| 
            puts "#{num}. #{artist.name}"
            num += 1 
        }
    end

    def list_songs_by_artist

        puts "Please enter the name of an artist:"
        x = gets.strip
        num = 1
        if artist = Artist.find_by_name(x)
            songs = artist.songs.sort{ |a, b| a.name <=> b.name }
            songs.each { |song|
                puts "#{num}. #{song.name} - #{song.genre.name}"
                num += 1
            }
        end

    end

    def list_songs_by_genre

        puts "Please enter the name of a genre:"
        x = gets.strip
        num = 1
        if genre = Genre.find_by_name(x)
            songs = genre.songs.sort{ |a, b| a.name <=> b.name }
            songs.each { |song|
                puts "#{num}. #{song.artist.name} - #{song.name}"
                num += 1
            }
        end
    end

    def play_song
        
        puts "Which song number would you like to play?"
        x = gets.strip.to_i
        if (x <= Song.all.length) && (x > 0)
            puts "Playing #{Song.all[x].name} by #{Song.all[x].artist.name}" 
        end

    end

end

