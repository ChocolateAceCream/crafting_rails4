$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mail_form/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mail_form"
  s.version     = MailForm::VERSION
  s.authors     = ["ChocolateAceCream"]
  s.email       = ["nuodi@hotmail.com"]
  s.homepage    = "http://www.google.com"
  s.summary     = "Summary of MailForm."
  s.description = "Description of MailForm."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency  "capybara", "~>2.0.0"
end
