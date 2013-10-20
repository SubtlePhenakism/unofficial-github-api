require File.expand_path('../lib/unofficial-github-api/version', __FILE__)
require 'date'

Gem::Specification.new do |gem|
  gem.name = 'unofficial-github-api'
  gem.version = GithubApi::VERSION
  gem.date = Date.today.to_s
  gem.license = 'MIT'
  gem.summary = %Q{Unofficial Github API}
  gem.description = %Q{Read more documentation at repository homepage.}
  gem.authors = ['Max Makarochkin']
  gem.email = 'maxim.makarochkin@gmail.com'
  gem.homepage = 'https://github.com/mac-r/unofficial-github-api'
  gem.require_path = 'lib'
  gem.files = Dir.glob("{lib,spec}/**/*")
  gem.required_ruby_version = '>= 1.9.3'
  gem.add_dependency 'bundler'
  gem.add_dependency 'rake'
  gem.add_dependency 'rspec'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'work_queue'
  gem.add_dependency 'chronic'

end
