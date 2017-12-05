lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "normalized_types/version"

Gem::Specification.new do |spec|
  spec.name          = "normalized_types"
  spec.version       = NormalizedTypes::VERSION
  spec.authors       = ["Peter Schilling"]
  spec.email         = ["peter@peterschilling.org"]

  spec.summary       = %q{Easily normalize values in Rails}
  spec.description   = %q{Avoid storing blank strings}
  spec.homepage      = "https://github.com/schpet/normalized_types"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activemodel"
end
