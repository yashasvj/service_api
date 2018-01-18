$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "service_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "service_api"
  s.version     = ServiceApi::VERSION
  s.authors     = ["Yashas Vijaybhaskar"]
  s.email       = ["yashas@finalcad.com"]
  s.homepage    = "https://www.finalcad.com/"
  s.summary     = "Summary of ServiceApi."
  s.description = "Api to get and set the versions of plugin"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.required_ruby_version = ">= 2.3.1"
  s.add_dependency "rails", "~> 4.2.10"

end
