class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        directory = Dir.entries(@path+"/")
        directory.select {|file_path| file_path.end_with? ".mp3" }
    end

    def import
        self.files.each {|file| Song.create_from_filename(file)}
    end

end