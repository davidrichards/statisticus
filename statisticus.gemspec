# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{statisticus}
  s.version = "0.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Richards"]
  s.date = %q{2009-04-29}
  s.default_executable = %q{stats}
  s.description = %q{Statisticus is a better bridge between RSRuby and Ruby.  It makes a lot of the work nearly seamless between the two worlds.}
  s.email = %q{davidlamontrichards@gmail.com}
  s.executables = ["stats"]
  s.files = ["LICENSE", "Rakefile", "README.rdoc", "VERSION.yml", "bin/stats", "lib/featured_libs", "lib/featured_libs/distributions.rb", "lib/overrides", "lib/overrides/array.rb", "lib/overrides/hash.rb", "lib/overrides/module.rb", "lib/overrides/rs_ruby.rb", "lib/overrides/symbol.rb", "lib/overrides/tegu_gears.rb", "lib/overrides.rb", "lib/statisticus", "lib/statisticus.rb", "spec/lib", "spec/lib/overrides", "spec/lib/overrides/array_spec.rb", "spec/lib/overrides/hash_spec.rb", "spec/lib/overrides/module_spec.rb", "spec/lib/overrides/symbol_spec.rb", "spec/lib/overrides/tegu_gears_spec.rb", "spec/spec_helper.rb", "spec/statisticus_spec.rb", "r_lib/geometric_mean.r", "r_lib/inverse_matrix.r", "r_lib/my_obj.r"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/davidrichards/statisticus}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Statistics in Ruby through RSRuby, but more graceful.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tegu_gears>, [">= 0"])
    else
      s.add_dependency(%q<tegu_gears>, [">= 0"])
    end
  else
    s.add_dependency(%q<tegu_gears>, [">= 0"])
  end
end
