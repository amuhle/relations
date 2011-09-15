# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "relations/version"

Gem::Specification.new do |s|
    s.name        = "relations"
    s.version     = Relations::VERSION
    s.summary     = 'Relations generator solution for Rails'
    s.authors     = ['Alvaro Muhlethaler', 'Sebastian Sierra']
    s.email       = ["amuhlethaler@vairix.com"]
    s.homepage    = "http://github.com/vairix-amuhlethaler/relations"
    s.description = 'Relations generator solution for Rails'

    s.rubyforge_project = "relations"

    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]

    s.add_dependency("rails", ">= 3.0.0")
    s.add_dependency("rails",  "<= 3.1.0.rc4")
end
