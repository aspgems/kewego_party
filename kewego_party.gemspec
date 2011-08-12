# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kewego_party/version"

Gem::Specification.new do |gem|
  gem.name = "kewego_party"
  gem.rubyforge_project = "kewego_party party"
  gem.summary = %q{Ruby wrapper for the Kewego API using HTTP Party}
  gem.description = %q{Ruby wrapper for the Kewego API using HTTP Party}

  gem.homepage = "https://github.com/aspgems/kewego_party"
  gem.authors = ["Paco Guzman"]
  gem.email = ["fjguzman@aspgems.com"]

  gem.version = KewegoParty::VERSION

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.platform = Gem::Platform::RUBY
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')

  gem.add_runtime_dependency 'httparty',    '~> 0.7.8'
  gem.add_runtime_dependency 'multi_xml',   '~> 0.2'
  gem.add_runtime_dependency 'rash',        '~> 0.3'
  gem.add_runtime_dependency 'hashie',      '~> 1.0.0'
  gem.add_runtime_dependency 'api_cache',   '~> 0.2.3'

  gem.add_development_dependency 'rake',    '~> 0.9'
  gem.add_development_dependency 'rspec',   '~> 2.6'
  gem.add_development_dependency 'vcr',     '~> 1.10'
  gem.add_development_dependency 'webmock', '~> 1.6'
end