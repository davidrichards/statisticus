require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "statisticus"
    s.summary = %Q{Statistics in Ruby through RSRuby, but more graceful.}
    s.email = "davidlamontrichards@gmail.com"
    s.homepage = "http://github.com/davidrichards/statisticus"
    s.description = "Statisticus is a better bridge between RSRuby and Ruby.  It makes a lot of the work nearly seamless between the two worlds."
    s.files =  FileList["[A-Z]*", "{bin,lib,spec,r_lib}/**/*"]
    s.authors = ["David Richards"]
    s.add_dependency 'tegu_gears'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'statisticus'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.libs << 'lib' << 'spec'
  t.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |t|
  t.libs << 'lib' << 'spec'
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)
rescue LoadError
  puts "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
end

task :default => :spec
