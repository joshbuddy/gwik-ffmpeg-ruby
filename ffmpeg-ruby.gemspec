# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'rake'
require 'ffmpeg/version'

Gem::Specification.new do |spec|
  spec.name = 'ffmpeg-ruby'
  spec.version = FFMPEG::VERSION
  spec.summary = 'Ruby C bindings to ffmpeg/av library, especially usefull to extract thumbnails'
  spec.author = "Antonin Amand"
  spec.email = 'antonin.amand@gmail.com'
  spec.files = Dir.glob("{bin,lib,ext}/**/*")
  spec.homepage = 'http://github.com/pcting/ffmpeg-ruby'
  spec.extensions << 'ext/ffmpeg/extconf.rb'
  spec.date = Time.now
  spec.requirements << 'ffmpeg library patched for ffmpeg-ruby'

  spec.add_development_dependency 'simplecov', ["0.4.2"]
  spec.add_development_dependency "rspec", ["~> 2.4.0"]
  spec.add_development_dependency 'rake', ["0.8.7"]
  spec.add_development_dependency 'rake-compiler'
end
