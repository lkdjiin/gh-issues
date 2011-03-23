# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'gh-issues'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'Display issues from a GitHub repository in a console window.'
  s.homepage = ''
  s.description = %q{Display issues from a GitHub repository in a console window.}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*'].to_a + readmes
  s.executables = ['gh-issues']
	s.license = 'GPLv3'
	s.required_ruby_version = '>= 1.9.2'
  s.add_dependency('json', '>= 1.5.1')
  s.add_dependency('rainbow', '>= 1.1.1')
end
