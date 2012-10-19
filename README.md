# Cloudsheet
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kurtisnelson/cloudsheet) [![Build Status](https://secure.travis-ci.org/kurtisnelson/cloudsheet.png?branch=master)](http://travis-ci.org/kurtisnelson/cloudsheet)

Load Google Drive Spreadsheets sanely. It is [published](https://rubygems.org/gems/cloudsheet) on RubyGems. Full documentation is at [rubydoc.info](http://rubydoc.info/gems/cloudsheet/)

## Usage
Setup the Cloudsheet. sheet is an optional worksheet ID.

```ruby
cloudsheet = Cloudsheet::Drive.new(user: "me@example.com", password: "secret", sheet_key: "SPREADSHEETID")`
```

Setup an optional mapping of column #s to names and lambdas. The default operation is to no-op.

```ruby
m = Cloudsheet::Map.new
m[0] = Cloudsheet::Mapping.new(:name)
m[1] = Cloudsheet::Mapping.new(:score).type(Float)
m[2] = Cloudsheet::Mapping.new(:cash).type("money")
m[3] = Cloudsheet::Mapping.new(:start_date).map(->(d) {DateTime.strptime(d, "%m/%d/%Y")})
```

The map will try to do the right thing and if nil is passed in, it will skip the lambda and output nil.

Select a worksheet if not the first one and pass in an optional map

```ruby
cloudsheet.sheet(0).map(m)
cloudsheet.each do |row|
    row["name"] # Column 0
    row["start_date"] # DateTime object created from column 1
    row[2] # Un-mapped columns
end

puts "That was easy!"
```

## Contributing to Cloudsheet
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Kurt Nelson. See LICENSE.txt for
further details.

