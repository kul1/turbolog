
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "turbolog/version"

Gem::Specification.new do |spec|
  spec.name          = "turbolog"
  spec.version       = Turbolog::VERSION
  spec.authors       = ["Prateep Kul"]
  spec.email         = ["1.0@kul.asia"]

  spec.summary       = %q{Create login with devise, omniauth }
  spec.description   = %q{Create login with devise, omniauth and facebook}
  spec.homepage      = "https://github.com/kul1/turbolog"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
    end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  #spec.add_development_dependency "coveralls"

end
