require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :console do
  require 'irb'
  require 'irb/completion'
  require 'restconomic'
  ARGV.clear
  IRB.start
end

task :default => :spec
