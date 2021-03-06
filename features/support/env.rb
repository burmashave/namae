require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

begin
  require 'simplecov'
  require 'coveralls' if ENV['CI']
rescue LoadError
  # ignore
end unless RUBY_VERSION < '1.9'

begin
  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
    require 'rubinius/debugger'
  else
    require 'debugger'
  end
rescue LoadError
  # ignore
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'namae'

require 'rspec/expectations'
