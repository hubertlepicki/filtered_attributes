$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "filtered_attributes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "filtered_attributes"
  s.version     = FilteredAttributes::VERSION
  s.authors     = ["Hubert Lepicki"]
  s.email       = ["hubert.lepicki@amberbit.com"]
  s.homepage    = "http://amberbit.com/"
  s.summary     = "Provides alternative way to filter mass-assignment attributes, which you pass to ActiveModel models in controllers."
  s.description = "Different than attr_accessible/protected (that can still be used with this gem), you can specify which parameters will be allowed in your controllers."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
end
