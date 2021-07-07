# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firebug/version'

Gem::Specification.new do |spec| # rubocop:disable BlockLength
  spec.name          = 'firebug'
  spec.version       = Firebug::VERSION
  spec.authors       = ['Aaron Frase']
  spec.email         = ['aaron@rvshare.com']

  spec.summary       = 'Gem for working with CodeIgniter sessions'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/rvshare/firebug'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.metadata['yard.run']        = 'yri' # use "yard" to build full HTML docs.
  spec.metadata['changelog_uri']   = 'https://github.com/rvshare/firebug/blob/master/CHANGELOG.md'
  spec.metadata['source_code_uri'] = spec.homepage

  spec.add_dependency 'actionpack', '> 5.0'
  spec.add_dependency 'activerecord', '> 5.0'
  spec.add_dependency 'ruby-mcrypt', '~> 0.2'

  spec.add_development_dependency 'bundler', '~> 2.0', '>= 2.0.1'
  spec.add_development_dependency 'database_cleaner', '~> 1.7'
  spec.add_development_dependency 'pry', '~> 0.13.0'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.2'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  spec.add_development_dependency 'rubocop', '~> 1.18.3'
  spec.add_development_dependency 'rubocop-performance', '~> 1.5.2'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.32'
  spec.add_development_dependency 'simplecov', '~> 0.17'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
  spec.add_development_dependency 'yard', '~> 0.9.18'
end
