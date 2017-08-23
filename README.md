# OmniAuth Discord

Discord OAuth2 Strategy for OmniAuth.

Read the Discord API documentation for more details: https://discordapp.com/developers/docs/topics/oauth2

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-discord'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Discord` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET']
end
```

By default, Discord does not return a user's email address. Their API uses
[scopes](https://discordapp.com/developers/docs/topics/oauth2#scopes) to provide
access to certain resources of a user's account. For example, to get a user's
email set the scope to `email`.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET'], scope: 'email'
end
```

You can pass multiple scopes in the same string. For example to get a user's
Discord account info set the scope to `email identify`


```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET'], scope: 'email identify'
end
```

## Specifying additional permissions

You can also request additional permissions from the user. See the
[permission help page](https://discordapp.com/developers/docs/topics/permissions#bitwise-permission-flags) for a list of all available options.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET'], scope: 'identify  bot', permissions: 0x00000010 + 0x10000000
end
```

This will request permission to the MANAGE_CHANNELS and the MANAGE_ROLES
permissions.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adaoraul/omniauth-discord.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
