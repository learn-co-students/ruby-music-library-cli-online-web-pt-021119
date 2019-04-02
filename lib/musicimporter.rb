class MusicImporter
	attr_accessor :path, :files

	def initialize(path)
		@path = path
		@files = Dir.children(@path)
	end

	def import
		#binding.pry
		@files.each {|file| Song.create_from_filename(file)}
	end
end