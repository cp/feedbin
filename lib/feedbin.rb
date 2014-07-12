require 'feedbin/version'
require 'httparty'
require 'json'

class FeedbinAPI
  attr_accessor :email, :password
  def initialize(email, password)
    @email, @password = email, password
  end

  # Entries

  def entries(options = {})
    HTTParty.get("https://api.feedbin.me/v2/entries.json", query: options, basic_auth: { username: @email, password: @password })
  end

  def entry(id)
    HTTParty.get("https://api.feedbin.me/v2/entries/#{id}.json", basic_auth: { username: @email, password: @password })
  end

  def unread_entries
    HTTParty.get("https://api.feedbin.me/v2/unread_entries.json", basic_auth: { username: @email, password: @password })
  end

  def star(id)
    HTTParty.post("https://api.feedbin.me/v2/starred_entries.json", 
      body: { 'starred_entries' => id }.to_json, 
      headers: { 'Content-Type' => 'application/json' },
      basic_auth: { username: @email, password: @password }).code
  end

  def unstar(id)
    HTTParty.post("https://api.feedbin.me/v2/starred_entries/delete.json", 
      body: { 'starred_entries' => id }.to_json, 
      headers: { 'Content-Type' => 'application/json' },
      basic_auth: { username: @email, password: @password }).code
  end

  def mark_as_read(id)
    HTTParty.post("https://api.feedbin.me/v2/unread_entries/delete.json", 
      body: { 'unread_entries' => id }.to_json, 
      headers: { 'Content-Type' => 'application/json' },
      basic_auth: { username: @email, password: @password }).code
  end

  def mark_as_unread(id)
    HTTParty.post("https://api.feedbin.me/v2/unread_entries.json", 
      body: { 'unread_entries' => id }.to_json, 
      headers: { 'Content-Type' => 'application/json' },
      basic_auth: { username: @email, password: @password }).code
  end

  # Feeds

  def feed(id)
    HTTParty.get("https://api.feedbin.me/v2/feeds/#{id}.json", basic_auth: { username: @email, password: @password })
  end

  # Subscriptions

  def subscribe(url)
    HTTParty.post("https://api.feedbin.me/v2/subscriptions.json", 
      body: { 'feed_url' => url }.to_json, 
      headers: { 'Content-Type' => 'application/json' },
      basic_auth: { username: @email, password: @password }).code
  end

  def unsubscribe(id)
    HTTParty.delete("https://api.feedbin.me/v2/subscriptions/#{id}.json", basic_auth: { username: @email, password: @password }).code
  end

  def subscriptions(options = {})
    if options[:since]
      resp = HTTParty.get("https://api.feedbin.me/v2/subscriptions.json", query: { since: options[:since] }, basic_auth: { username: @email, password: @password })
      return resp == [] ? resp : 'There have been no subscriptions since this date.'.to_json unless resp.code != 200
    else
      HTTParty.get("https://api.feedbin.me/v2/subscriptions.json", basic_auth: { username: @email, password: @password })
    end
  end
end
