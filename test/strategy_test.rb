require 'helper'
require 'openssl'

class StrategyTest < StrategyTestCase
  include OAuth2StrategyTests
end

class ClientTest < StrategyTestCase
  test 'has correct discord site' do
    assert_equal 'https://discordapp.com/api/oauth2/', strategy.client.site
  end

  test 'has correct authorize url' do
    assert_equal 'https://discordapp.com/api/oauth2/authorize', strategy.client.options[:authorize_url]
  end

  test 'has correct token url' do
    assert_equal 'https://discordapp.com/api/oauth2/token', strategy.client.options[:token_url]
  end
end
