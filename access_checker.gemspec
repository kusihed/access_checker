Gem::Specification.new do |s|
  s.name = "access_checker"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Markus Hediger"]
  s.date = "2018-01-01"
  s.description = "Simple access control on controller basis"
  s.email = "m.hed@gmx.ch"
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".releaser_config",
    "Gemfile",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/access_checker/access_control.rb",
    "lib/access_checker/base.rb",
    "lib/access_checker/control.rb",
    "lib/access_checker/subject_extensions.rb",
    "lib/access_checker.rb",
    "rails/init.rb",
    "access_checker.gemspec"
  ]
  s.homepage = "http://github.com/kusihed/access_checker"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.summary = "Simple access control on controller basis"

  s.add_development_dependency "rails", "~> 5.0"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "turn"
end

