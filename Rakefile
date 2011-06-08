require 'rubygems'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => :build

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
end
