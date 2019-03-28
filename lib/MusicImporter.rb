require_relative '../config/environment.rb'

class MusicImporter
    attr_accessor :files, :path

    def initialize(path)
        @files=Dir["#{path}/*"] 
        # binding.pry
        @files = @files.map{|file|file.gsub("#{path}/","")}
        @path=path
    end

    def import
        @files.each {|file|Song.create_from_filename(file)}
    end

end