require 'spec_helper'

describe FeedbinAPI do

  before do
    @feedbin = FeedbinAPI.new(ENV["EMAIL"], ENV["PASSWORD"])
  end

  describe '.entries' do
  	it 'should return a 200' do
      stub_request(:get, "https://#{ENV["EMAIL"]}:#{ENV["PASSWORD"]}@api.feedbin.me/v2/entries.json").to_return(status: 200)
      @feedbin.entries.code.should == 200
  	end
  end

  describe '.subscriptions' do
    it 'should return 201' do
      stub_request(:get, "https://#{ENV["EMAIL"]}:#{ENV["PASSWORD"]}@api.feedbin.me/v2/subscriptions.json").to_return(status: 200)
      @feedbin.subscriptions.code.should == 200
    end
  end
end