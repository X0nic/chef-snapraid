#!/usr/bin/env rake
require 'rubocop'
desc 'Run tests and rubocop'
task :default do
  Rake::Task['rubocop'].invoke
  Rake::Task['foodcritic'].invoke
end

task :rubocop do
  require 'rubocop'
  puts 'Running RuboCop...'
  cli = RuboCop::CLI.new
  cli.run(%w(--fail-level R))
  puts "\n\n"
end

task :foodcritic do
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    sandbox = File.join(File.dirname(__FILE__), %w(tmp foodcritic cookbook))
    prepare_foodcritic_sandbox(sandbox)
    puts 'Running foodcritic...'
    sh "foodcritic -f any #{File.dirname(sandbox)}"
    puts "\n\n"
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
end
