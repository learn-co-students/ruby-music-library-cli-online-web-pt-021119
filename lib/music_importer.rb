require 'pry'
class MusicImporter

attr_reader :path

def initialize(path)
  @path = path
end

def path
  @path
end

def files
  #glob just like in previous lab
  #NOTE collect and map are the same, returns a new arr with the results of the running block once
  Dir.glob("#{path}/*.mp3").collect{|x| x.gsub("#{path}/", "")}
  #NOTE gsub performed on a string, returns a copy of the string with ALL of the pattern occurances subbed as per the second argument
end

def import
  files.each {|file| Song.create_from_filename(file)}
end
end
