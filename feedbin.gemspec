# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feedbin/version'

Gem::Specification.new do |spec|
  spec.name          = "feedbin"
  spec.version       = Feedbin::VERSION
  spec.author        = "Colby Aley"
  spec.email         = "colby@aley.me"
  spec.description   = %q{A Ruby wrapper for the Feedbin API}
  spec.summary       = %q{Ruby wrapper for the Feedbin API}
  spec.homepage      = "https://github.com/ColbyAley/feedbin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14"
  spec.add_runtime_dependency "httparty"
end