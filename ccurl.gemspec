# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ccurl/version'

Gem::Specification.new do |spec|
  spec.name          = "ccurl"
  spec.version       = CCurl::VERSION
  spec.authors       = ["iaintshine"]
  spec.email         = ["bodziomista@gmail.com"]
  spec.description   = %q{Wrapper over cURL command line tool with fancy output - colors and line numbers}
  spec.summary       = %q{Wrapper over cURL command line tool with fancy output}
  spec.homepage      = "https://github.com/iaintshine/ccurl"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  puts spec.executables.inspect
  
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
