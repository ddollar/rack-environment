# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-environment}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Dollar"]
  s.date = %q{2009-11-09}
  s.description = %q{Rack middleware to set ENVironment variables around your app.}
  s.email = %q{ddollar@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/rack-environment.rb",
     "lib/rack_environment.rb",
     "lib/rack_environment/task.rb",
     "rack-environment.gemspec",
     "spec/config/blank.yml",
     "spec/config/environment.yml",
     "spec/rack_environment_spec.rb",
     "spec/rcov.opts",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/test_application.rb"
  ]
  s.homepage = %q{http://github.com/ddollar/rack-environment}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Rack middleware to set ENVironment variables around your app.}
  s.test_files = [
    "spec/rack_environment_spec.rb",
     "spec/spec_helper.rb",
     "spec/test_application.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
  end
end
