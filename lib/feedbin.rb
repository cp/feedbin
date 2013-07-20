require 'feedbin/version'
require 'httparty'
require 'json'

class FeedbinAPI
  attr_accessor :email, :password
  def initialize(email, password)
    @email, @password = email, password
  end

  def entries
    HTTParty.get("https://api.feedbin.me/v2/entries.json", basic_auth: { username: @email, password: @password })
  end

  def entry(id)
    HTTParty.get("https://api.feedbin.me/v2/entries/#{id}.json", basic_auth: { username: @email, password: @password })
  end

  def unread_entries
    HTTParty.get("https://api.feedbin.me/v2/unread_entries.json", basic_auth: { username: @email, password: @password })
  end

  def mark_as_read(id)
  HTTParty.post("https://api.feedbin.me/v2/unread_entries/delete.json", 
    body: { 'unread_entries' => id }.to_json, 
    headers: { 'Content-Type' => 'application/json' },
    basic_auth: { username: @email, password: @password })
  end

  def mark_as_unread(id)
  HTTParty.post("https://api.feedbin.me/v2/unread_entries.json", 
    body: { 'unread_entries' => id }.to_json, 
    headers: { 'Content-Type' => 'application/json' },
    basic_auth: { username: @email, password: @password })
  end

  def subscribe(url)
    HTTParty.post("https://api.feedbin.me/v2/subscriptions.json", 
      body: { 'feed_url' => url }.to_json, 
      headers: { 'Content-Type' => 'application/json' },
      basic_auth: { username: @email, password: @password })
  end

  def subscriptions
    HTTParty.get("https://api.feedbin.me/v2/subscriptions.json", basic_auth: { username: @email, password: @password })
  end
end