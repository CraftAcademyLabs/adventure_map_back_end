$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'admin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'admin'
  s.version     = Admin::VERSION
  s.authors     = ['tochman']
  s.email       = ['thomas@craftacademy.se']
  s.homepage    = ''
  s.summary     = 'Summary of Admin.'
  s.description = 'Description of Admin.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.1'
  s.add_dependency 'godmin', '~> 1.5'
end
