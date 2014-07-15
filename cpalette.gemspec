# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cpalette/version'

Gem::Specification.new do |spec|
  spec.name          = "cpalette"
  spec.version       = Cpalette::VERSION
  spec.authors       = ["avinash-vllbh"]
  spec.email         = ["avinash.vallab@gmail.com"]
  spec.summary       = "Palette of colors to choose from."
  spec.description   = "A simple color gem that returns you with a palette of colors which are web friendly and easy to use."
  spec.homepage      = "http://rubygems.org/gems/cpalette"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
