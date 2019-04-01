class MusicImporter
    def initialize(path)
        @path = path
    end

    def path
        @path
    end

    def files
        # Obtain the files with extension *.mp3 from 'path'
        @files ||= Dir.glob("#{path}/*.mp3").collect {|song_name| song_name.gsub("#{path}/", "")}
    end

    def import
        self.files.each {|filename| Song.create_from_filename(filename)}
    end

end