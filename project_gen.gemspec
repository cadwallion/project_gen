# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'project_gen/version'

Gem::Specification.new do |gem|
  gem.name          = "project_gen"
  gem.version       = ProjectGen::VERSION
  gem.authors       = ["Andrew Nordman"]
  gem.email         = ["cadwallion@gmail.com"]
  gem.description   = %q{New project creation tool}
  gem.summary       = %q{Project creation tool with delegations to existing tools like Bundler, SnakeSkin, etc}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
