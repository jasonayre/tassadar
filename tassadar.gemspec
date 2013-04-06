# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tassadar/version"

Gem::Specification.new do |s|
  s.name        = "tassadar"
  s.version     = Tassadar::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matt Pruitt", "Andrew Nordman"]
  s.email       = ["mpruitt@agoragames.com", "anordman@agoragames.com"]
  s.homepage    = "https://github.com/agoragames/tassadar"
  s.summary     = %q{Pure ruby MPQ and SC2 Replay parser}
  s.description = %q{Pure ruby MPQ and SC2 Replay parser}

  s.rubyforge_project = "tassadar"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("bindata")
  s.add_dependency("rbzip2")
  s.add_dependency("nokogiri", ">= 1.5.9")
  s.add_dependency("httparty")
  s.add_dependency("i18n")
  s.add_dependency("activesupport", '>= 3.0.0')
  s.add_development_dependency("pry")
  s.add_development_dependency("vcr")
  s.add_development_dependency("fakeweb")
end
