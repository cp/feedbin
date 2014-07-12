require 'rubygems'
require 'bundler/setup'
require 'webmock/rspec'

require 'feedbin'

RSpec.configure do |c|
  c.include(WebMock::API)
end