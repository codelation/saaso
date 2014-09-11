$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "saaso/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "saaso"
  s.version     = Saaso::VERSION
  s.authors     = ["Brian Pattison"]
  s.email       = ["brian@brianpattison.com"]
  s.homepage    = "https://github.com/codelation/saaso"
  s.summary     = "TODO: Summary of Saaso."
  s.description = "TODO: Description of Saaso."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "cancancan", "~> 1.9.2"
  s.add_dependency "devise", "~> 3.2.4"
  s.add_dependency "omniauth-github", "~> 1.1.2"
  s.add_dependency "money-rails", "~> 0.12.0"
  s.add_dependency "rails", "~> 4.1.5"

  s.add_development_dependency "sqlite3"
end
