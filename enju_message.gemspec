$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "enju_message/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_message"
  s.version     = EnjuMessage::VERSION
  s.authors     = ["Reiko Shinozuka"]
  s.email       = ["shinozuka.reiko@miraitsystems.jp"]
  s.homepage    = ""
  s.summary     = "enju_trunk_message plugin"
  s.description = "Message management for Enju Trunk"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "simple_form"
  s.add_dependency "awesome_nested_set", "~> 2.1"
  s.add_dependency "state_machine"
  s.add_dependency "inherited_resources"
  s.add_dependency "enju_core", "~> 0.1.1.pre2"
  s.add_dependency "resque_mailer"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.0"
end
