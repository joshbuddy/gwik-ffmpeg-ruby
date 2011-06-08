require 'simplecov'

SimpleCov.start do
  add_filter "spec/"
end

require 'rspec'
require 'rspec/mocks'
require 'ffmpeg'
include FFMPEG
