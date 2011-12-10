# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lazyhash/version"

Gem::Specification.new do |s|
  s.name        = "lazyhash"
  s.version     = LazyHash::VERSION
  s.authors     = ["Roger Campos"]
  s.email       = ["roger@itnig.net"]
  s.homepage    = "https://github.com/rogercampos/lazyhash"
  s.summary     = %q{add values to a hash with an arbitrary deep of keys}
  s.description = %q{add values to a hash with an arbitrary deep of keys}

  s.rubyforge_project = "lazyhash"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.5"
end
