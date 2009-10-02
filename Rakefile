require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the wysihat_engine plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the wysihat_engine plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'WysihatEngine'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "wysihat-engine"
    gem.summary = "A rails engine to allow users to use the WysiHat editors."
    gem.description = "A rails engine to allow users to use the WysiHat editors."
    gem.email = "jeff@80beans.com"
    gem.homepage = "http://github.com/80beans/wysihat-engine"
    gem.authors = ["Jeff Kreeftmeijer"] 
    gem.add_dependency('thoughtbot-paperclip')
    gem.add_dependency('giraffesoft-resource_controller')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end                                                                    

Jeweler::GemcutterTasks.new