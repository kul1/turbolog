# Turbolog

Turbolog is a gem to setup devise, omniauth and facebook authentication.

For the following configuration:

.Rails 5.1.4
.Ruby 2.4.1
.Devise
.Mongoid
.Omniauth_facebook

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'turbolog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install turbolog

Once turbolog gem bundled, there are 3 steps to install.

Step 1/3 execute :

    $ rails g turbolog:install

It will backup and will include several gems 

Step 2/3 bundle install

    $ bundle install


Step 3/3 execute :

    $ rails g turbolog:config

It will run mongoid:config, devise install, devise Users and config omniauth and generate scaffold welcome as an example 

## Usage

Your rails app will have Log In/Log Out with Facebook authentication as a template for your modification.

Additional Setup For Facebook in .env
for example
FACEBOOK_API="xxxxxxxxxxxxxxxxx"
FACEBOOK_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxx"  




Other command:

To remove devise line from config/routes by execute the following command

    $ rake turbolog:clean

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kul1/turbolog. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Turbolog project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kul1/turbolog/blob/master/CODE_OF_CONDUCT.md).
