require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bank_holiday"
  gem.homepage = "http://github.com/revans/bank_holiday"
  gem.license = "MIT"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "robert@codewranglers.org"
  gem.authors = ["Robert R Evans"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern    = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = ["--color", "--format progress"]
end

RSpec::Core::RakeTask.new(:rcov) do |spec|  
  spec.pattern    = 'spec/**/*_spec.rb'
  spec.rcov_opts  = ["--sort coverage",  
                     "--profile",
                     "--rails",
                     "--exclude /gems/,/Library/,spec/rvm"]
  spec.rcov = true
  
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "bank_holiday #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


desc "view date docs"
task :view_docs do
  file = File.expand_path(File.join(File.dirname(__FILE__), 'docs/lib/core_ext/date.html'))
  system("open -a safari #{file}")
end
