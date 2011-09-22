# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wraps/version"

Gem::Specification.new do |s|
  s.name        = "wraps"
  s.version     = Wraps::VERSION
  s.authors     = ["Christopher Giroir"]
  s.email       = ["kelsin@valefor.com"]
  s.homepage    = "http://mx.kelsin.net"
  s.summary     = %q{A wrapper for Active Model objects}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "wraps"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activemodel', '~> 3.0'
  s.add_dependency 'activesupport', '~> 3.0'
end
