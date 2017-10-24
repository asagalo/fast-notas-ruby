$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "invoicer_connector"
require "minitest/autorun"
require 'minitest/autorun'
require 'minitest/spec'
require 'vcr'
require 'pry-byebug'

VCR.configure do |c|
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'test/fixtures/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
