# frozen_string_literal: true

require_relative 'lib/warframe/version'

Gem::Specification.new do |spec|
  # Required
  spec.name = 'warframe'
  spec.version = Warframe::VERSION
  spec.authors = ['A.J. Romaniello', 'Warframe Community Developers']

  # Descriptive
  spec.summary = 'A Ruby interface to the WarframeStat API.'
  spec.description = spec.summary
  spec.license = 'MIT'
  spec.homepage = 'https://github.com/WFCD/warframe-ruby'

  # MetaData
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['documentation_uri'] = "https://rubydoc.info/gems/#{spec.name}"

  # Executables / Files
  spec.bindir = 'exe'
  spec.require_paths = ['lib']

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z lib *.gemspec README.md CHANGELOG.md *.txt .yardopts`.split("\x0")
  end

  # Dependencies
  spec.required_ruby_version = '>= 2.5.0'
  spec.add_dependency 'fast_underscore', '~> 0.3'
  spec.add_dependency 'http', '>= 5', '< 7'
  spec.add_dependency 'json', '~> 2.6'

  # Development Dependencies
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 1.24'
  spec.add_development_dependency 'thor', '~> 1.1'
  spec.add_development_dependency 'yard', '~> 0.9'
end
