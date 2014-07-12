Feedbin [![Build Status](https://travis-ci.org/ColbyAley/feedbin.png?branch=master)](https://travis-ci.org/ColbyAley/feedbin)
===

A simple Ruby wrapper for v2 of the [Feedbin.me](http://feedbin.me) REST [API](https://github.com/feedbin/feedbin-api). Includes functionality for retrieving entries and subscribing to feeds.

This is an unoficial gem, and is not affiliated with Feedbin.

## Installation

Add this line to your application's Gemfile:

  `gem 'feedbin'`

And then execute:

  `$ bundle`

Or install it yourself as:

  `$ gem install feedbin`

## Usage

### Examples
    @feedbin = FeedbinAPI.new('colby@aley.me','pa$$w0rd')

    @feedbin.entries
    # => (array of entry hashes)

    #feedbin.entries(read: false)
    # => (an array of unread entries as hashes)

    @feedbin.unread_entries
    # => (array of unread entry IDs)

    entry_id = @feedbin.entries[0]["id"] # Let's get the ID of the first entry in our array.

    @feedbin.entry(entry_id)
    # => (entry)

    @feedbin.mark_as_read(entry_id)
    # => entry_id

    @feedbin.mark_as_unread(entry_id)
    # => entry_id

    @feedbin.subscribe('http://colbyaley.com/feed')
    # => 200

    @feedbin.subscriptions
    # => (an array with hashes of all subscriptions)

### Sample Sinatra App

    require 'sinatra'
    require 'feedbin'

    FEEDBIN = FeedbinAPI.new('colby@aley.me','pa$$w0rd')

    get '/' do
      FEEDBIN.entries
    end

    get '/subscribe/:url' do
      FEEDBIN.subscribe(url.to_s)
    end

...you get the picture.

## Todo
- Move away from HTTParty because of it's massive overhead.

## Testing

Rspec is used for tests. WebMock is used to avoid touching the live Feedbin API.

Please add tests when contrinuting, and make sure that they all pass before submitting a PR.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add test coverage for your code.
4. Run `rspec`. If there are any failures, please fix them before moving forward.
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
