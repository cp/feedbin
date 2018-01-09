require 'spec_helper'

describe FeedbinAPI do

  before do
    @feedbin = FeedbinAPI.new('email', 'password')
  end

  describe '#entries' do
  	it 'should get entries and return a 200' do
      stub_request(:get, "https://api.feedbin.me/v2/entries.json?")
        .with(basic_auth: ['email', 'password']).to_return(status: 200)
      expect(@feedbin.entries.code).to eq(200)
  	end

    it 'should return a 200 when parameter is passed' do
      stub_request(:get, "https://api.feedbin.me/v2/entries.json?read=false")
        .with(basic_auth: ['email', 'password']).to_return(status: 200)
      expect(@feedbin.entries(read: false).code).to eq(200)
    end
  end

  describe '#entries_for_feed' do
    it 'should get entries for a feed and return a 200' do
      stub_request(:get, "https://api.feedbin.me/v2/feeds/42/entries.json")
        .with(basic_auth: ['email', 'password']).to_return(status: 200)
      expect(@feedbin.entries_for_feed(42).code).to eq(200)
    end
  end

  describe '#subscriptions' do
    it 'should get subscriptions and return a 200' do
      stub_request(:get, "https://api.feedbin.me/v2/subscriptions.json")
        .with(basic_auth: ['email', 'password']).to_return(status: 200)
      expect(@feedbin.subscriptions.code).to eq(200)
    end
  end

  describe '#unsubscribe' do
    it 'should unsubscribe and return a 204' do
      stub_request(:delete, "https://api.feedbin.me/v2/subscriptions/260815.json")
        .with(basic_auth: ['email', 'password']).to_return(status: 204)
      expect(@feedbin.unsubscribe(260815)).to eq(204)
    end
  end

  describe '#feed' do
    it 'should get feed and return a 200' do
      stub_request(:get, "https://api.feedbin.me/v2/feeds/1.json")
        .with(basic_auth: ['email', 'password']).to_return(status: 200)
      expect(@feedbin.feed(1).code).to eq(200)
    end
  end

  describe '#star' do
    it 'should star a post and return a 200' do
      stub_request(:post, "https://api.feedbin.me/v2/starred_entries.json")
        .with(basic_auth: ['email', 'password']).to_return(status: 200)
      expect(@feedbin.star(33)).to eq(200)
    end

    it 'should star an array of posts and return a 200' do
      stub_request(:post, "https://api.feedbin.me/v2/starred_entries.json")
        .with(basic_auth: ['email', 'password']).to_return(status: 200)
      expect(@feedbin.star([33,44,55,66,77])).to eq(200)
    end
  end
end
