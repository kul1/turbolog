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
  spec.add_development_dependency "rspec", "~> 0"
  spec.add_development_dependency "rspec-nc", "~> 0"
  spec.add_development_dependency "guard", "~> 0"
  spec.add_development_dependency "guard-rspec", "~> 0"
  spec.add_development_dependency "pry", "~> 0"
  spec.add_development_dependency "pry-remote", "~> 0"
  spec.add_development_dependency "pry-nav", "~> 0"
  spec.add_development_dependency "haml", ">= 5.0.4"
  spec.add_development_dependency "haml-rails","~> 0"

end
