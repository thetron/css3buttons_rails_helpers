# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "css3buttons/version"

Gem::Specification.new do |s|
  s.name        = "css3buttons"
  s.version     = Css3buttons::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicholas Bruning"]
  s.email       = ["nicholas@bruning.com.au"]
  s.homepage    = "https://github.com/thetron/css3buttons_rails_helpers"
  s.summary     = %q{Easy, beautiful buttons, the CSS3 way.}
  s.description = %q{Rails helper methods and generators for the css3buttons by Michael Henriksen.}

  s.rubyforge_project = "css3buttons"

  s.add_dependency 'actionpack', '>= 3.0.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
