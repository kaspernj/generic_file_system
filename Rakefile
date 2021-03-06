require "rubygems"
require "bundler"
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"
  exit e.status_code
end
require "rake"

require "jeweler"
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "generic_file_system"
  gem.homepage = "http://github.com/kaspernj/generic_file_system"
  gem.license = "MIT"
  gem.summary = %(A framework to working with various kinds of file systems the same way)
  gem.description = %(A framework to working with various kinds of file systems the same way)
  gem.email = "kaspernj@gmail.com"
  gem.authors = ["kaspernj"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require "rspec/core"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList["spec/**/*_spec.rb"]
end

desc "Code coverage detail"
task :simplecov do
  ENV["COVERAGE"] = "true"
  Rake::Task["spec"].execute
end

task default: :spec

require "rdoc/task"
Rake::RDocTask.new do |rdoc|
  version = File.exist?("VERSION") ? File.read("VERSION") : ""

  rdoc.rdoc_dir = "rdoc"
  rdoc.title = "generic_file_system #{version}"
  rdoc.rdoc_files.include("README*")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

require "best_practice_project"
BestPracticeProject.load_tasks
