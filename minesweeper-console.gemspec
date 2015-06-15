# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minesweeper/console/version'

Gem::Specification.new do |spec|
  spec.name          = "minesweeper-console"
  spec.version       = Minesweeper::Console::VERSION
  spec.authors       = ["Sébastien Varlet"]
  spec.email         = ["sebastien.varlet@plumbee.co.uk"]
  spec.summary       = %q{Console UI for the minesweeper game.}
  spec.description   = %q{Console UI for the minesweeper game.}
  spec.homepage      = "https://github.com/svarlet/minesweeper-console"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-test"
  spec.add_development_dependency "guard-ctags-bundler"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rainbow", "~> 2.0.0"

  spec.add_runtime_dependency "minesweeper-core", "~> 2.0.0"
end
