require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

desc 'Use rubocop to validate source files'
task :lint do
  sh 'rubocop --display-cop-names'
end
