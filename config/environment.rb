require 'bundler'
Bundler.require

module Concerns
	module Findable
		def find_by_name(name)
			all.find {|item| item.name == name }
		end

		def find_or_create_by_name(name)
			find_by_name(name) || self.create(name)
		end

		def destroy_all
			all.clear
		end

		def create(name)
			created = self.new(name)
			created.save
			created
		end
	end

	module InstanceMethods

		def initialize(name)
			@name = name
			@songs = []
		end

		def save
			self.class.all << self
		end
	end
end

require_all 'lib'