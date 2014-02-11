# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nps/version'

Gem::Specification.new do |spec|
  spec.name          = "nps"
  spec.version       = Nps::VERSION
  spec.authors       = ["Murray Summers"]
  spec.email         = ["murray.sum@gmail.com"]
  spec.description   = %q{Net Promoter Score (NPS) is a customer loyalty metric allowing customer satisfaction to be compared over time and business sector.}
  spec.summary       = %q{A Net Promoter Score (NPS) calculator}
  spec.homepage      = "https://github.com/murraysum/nps"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
