# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{statisticus}
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Richards"]
  s.date = %q{2009-04-28}
  s.default_executable = %q{stats}
  s.description = %q{TODO}
  s.email = %q{davidlamontrichards@gmail.com}
  s.executables = ["stats"]
  s.files = ["README.rdoc", "VERSION.yml", "bin/stats", "lib/featured_libs", "lib/featured_libs/distributions.rb", "lib/overrides", "lib/overrides/array.rb", "lib/overrides/hash.rb", "lib/overrides/module.rb", "lib/overrides/rs_ruby.rb", "lib/overrides/symbol.rb", "lib/overrides/tegu_gears.rb", "lib/overrides.rb", "lib/statisticus", "lib/statisticus.rb", "spec/lib", "spec/lib/overrides", "spec/lib/overrides/array_spec.rb", "spec/lib/overrides/hash_spec.rb", "spec/lib/overrides/module_spec.rb", "spec/lib/overrides/symbol_spec.rb", "spec/lib/overrides/tegu_gears_spec.rb", "spec/spec_helper.rb", "spec/statisticus_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/davidrichards/statisticus}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
