require 'bundler'
require 'pry'

Bundler.require

module Concerns
  require_relative "../lib/concerns/findable.rb"
end

require_all 'lib'
