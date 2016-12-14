$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pdf_renderer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pdf_renderer"
  s.version     = PdfRenderer::VERSION
  s.authors     = ["Di Sheng"]
  s.email       = ["nuodi@hotmail.com"]
  s.homepage    = "http://52.206.106.168:3000/"
  s.summary     = "first rails plugin"
  s.description = "Description of PdfRenderer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "prawn", "0.12.0"

  s.add_development_dependency "sqlite3"
end
