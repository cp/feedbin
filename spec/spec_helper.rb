require 'rubygems'
require 'bundler/setup'
require 'webmock/rspec'

require 'feedbin'

ENV['EMAIL'] ||= 'email@email.com'
ENV['PASSWORD'] ||= 'pa$$word'

RSpec.configure do |c|
  c.include(WebMock::API)
end