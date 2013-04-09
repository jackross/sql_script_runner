# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sql_script_runner/version"

Gem::Specification.new do |s|
  s.name        = "sql_script_runner"
  s.version     = SQLScriptRunner::VERSION
  s.authors     = ["Jack A Ross"]
  s.email       = ["jack.ross@technekes.com"]
  s.homepage    = ""
  s.summary     = %q{Gem for facilitating running SQL Scripts}
  s.description = %q{Only works in SQL Server for now}

  s.rubyforge_project = "sql_script_runner"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "tiny_tds"
  s.add_runtime_dependency "hirb"
end
