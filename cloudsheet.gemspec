lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudsheet/version'

Gem::Specification.new do |s|
  s.name = "cloudsheet"
  s.version = Cloudsheet::VERSION

  s.authors = ["Kurt Nelson"]
  s.date = "2012-11-15"
  s.description = "Pull google drive spreadsheets with your column names and datatypes"
  s.email = "kurtisnelson@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.homepage = "http://github.com/kurtisnelson/cloudsheet"
  s.licenses = ["MIT"]
  s.rubygems_version = "1.8.24"
  s.summary = "Load Google Drive Spreadsheets better"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency 'google_drive'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'bundler', '>= 1.0.0'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end

