# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cabrillo_meta/version'

Gem::Specification.new do |spec|
  spec.name          = "cabrillo_meta"
  spec.version       = CabrilloMeta::VERSION
  spec.authors       = ["Craig Weston"]
  spec.email         = ["craig@craigweston.ca"]
  spec.summary       = %q{Parses Cabrillo QSO templates into meta hash}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
