# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "webmetrics/version"

Gem::Specification.new do |s|
  s.name        = "webmetrics"
  s.version     = Webmetrics::VERSION
  s.authors     = ["Stephen Bush"]
  s.email       = ["stephenwyattbush@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Simple wrapper for Webmetrics API.}
  s.description = %q{Offers a convenience method for making requests to Webmetrics API.}

  s.rubyforge_project = "Webmetrics"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
