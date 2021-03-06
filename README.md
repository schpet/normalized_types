# NormalizedTypes

avoid storing garbage whitespace in your database

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'normalized_types'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install normalized_types

## Usage

```rb
class User < ActiveRecord::Base
  attribute :bio, :normalized_string
  attribute :name, :normalized_string, squish: true
end

# > User.new(bio: "").bio
# => nil
#
# > User.new(bio: " nice\n").bio
# => "nice"
#
# > User.new(name: "users\n\ncan\npost\nanything!").name
# => "users can post anything!"
```

see options and defaults in [string.rb](./lib/normalized_types/string.rb)

## Credit

This is based on a normalizeable module that [Corey Csuhta](https://github.com/csuhta) showed me.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/schpet/normalized_types. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NormalizedTypes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](./CODE_OF_CONDUCT.md).
