#!/usr/bin/env rake

desc 'Run tests and rubocop'
task default: [:rubocop, :foodcritic]

task :rubocop do
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

task :foodcritic do
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    sandbox = File.join(File.dirname(__FILE__), %w(tmp foodcritic cookbook))
    prepare_foodcritic_sandbox(sandbox)
    puts 'Running foodcritic...'
    sh "foodcritic -f any #{File.dirname(sandbox)}"
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

private

def prepare_foodcritic_sandbox(sandbox)
  files = %w(*.md *.rb attributes definitions files libraries providers
             recipes resources templates)

  rm_rf sandbox
  mkdir_p sandbox
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox
  puts "\n\n"
end
