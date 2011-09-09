# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruxero/version"

Gem::Specification.new do |s|
  s.name        = "RuXero"
  s.version     = Ruxero::VERSION
  s.authors     = ["Kieran Pilkington"]
  s.email       = ["kieran776@gmail.com"]
  s.homepage    = "https://github.com/KieranP/RuXero"
  s.summary     = %q{Xero API Ruby Client}
  s.description = %q{Xero API Ruby Client}

  s.required_rubygems_version = ">= 1.3.6"
  # s.rubyforge_project = "RuXero"

  s.add_development_dependency "rspec", "~> 2.6.0"
  s.add_development_dependency "mocha", "~> 0.10.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
