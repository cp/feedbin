require 'spec_helper'

describe Feedbin do

  before do
    @feedbin = Feedbin::API.new(ENV["EMAIL"], ENV["PASSWORD"])
  end

  describe '.entries' do
  	it 'should return a 200' do
      @feedbin.entries.code.should == 200
  	end

    it 'should return a 401' do
      feedbin = Feedbin::API.new('user@me.com', 'pass')
      feedbin.entries.code.should == 401
    end

    it 'should return an entry' do
      if @feedbin.entries[0]["id"]
        entry = @feedbin.entries[0]["id"]
        @feedbin.entry(entry).code.should == 200
      else
        pending "There are no entries to test with"
      end
    end
  end

  describe '.unread_entries' do
    it 'should return a 200' do
      @feedbin.unread_entries.code.should == 200
    end
  end

  describe '.mark_as_unread' do
    it 'should return 200' do
      if @feedbin.entries[0]
        entry = @feedbin.entries[0]["id"]
        @feedbin.mark_as_unread(entry).code.should == 200
      else
        pending "There are no entries to test with"
      end
    end

    it 'should have at least one entry in the unread entries list' do
      @feedbin.unread_entries[0].should_not be_nil
    end
  end

  describe '.mark_as_read' do
    it 'should return 200' do
      if @feedbin.unread_entries[0]
        entry = @feedbin.unread_entries[0]
        @feedbin.mark_as_read(entry.to_s).code.should == 200
      else
        pending "There are no entries to test with"
      end
    end
  end

  describe '.subscriptions' do
    it 'should return 201' do
      @feedbin.subscriptions.code.should == 200
    end
  end
end