# -*- encoding: utf-8 -*-

require 'rake'
require 'rspec/core/rake_task'

def ruby_files_for_shell
  files = Dir.glob 'lib/**/*.rb'
  files.join(' ')
end

desc 'Test gh-issues'
task :default => :spec

desc 'Test gh-issues with rspec'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color']
end

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  sh "reek --quiet #{ruby_files_for_shell} | ./reek.sed"
end

desc 'Check for duplicate code'
task :flay do
  puts 'Check for duplicate code...'
  exec "flay #{ruby_files_for_shell}"
end

desc 'Build gh-issues & install it'
task :install do
  sh "gem build gh-issues.gemspec"
	f = FileList['gh-issues*gem'].to_a
	sh "gem install #{f.first} --no-rdoc --no-ri"
end

desc 'Generate yard documentation for developpers'
task :doc do 
	exec 'yardoc --title "gh-issues Documentation" - NEWS COPYING VERSION'
end
