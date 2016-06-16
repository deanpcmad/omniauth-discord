require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Discord < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'email'
      
      option :name, "discord"

      option :client_options, {
        :site          => 'https://discordapp.com/api/oauth2/',
        :authorize_url => 'https://discordapp.com/api/oauth2/authorize',
        :token_url     => 'https://discordapp.com/api/oauth2/token'
      }
      
      option :authorize_options, [:scope]

      uid { raw_info['id'] }

      info do
        {
          :id            => raw_info['id'],
          :username      => raw_info['username'],
          :discriminator => raw_info['discriminator'],
          :avatar        => raw_info['avatar'],
          :verified      => raw_info['verified'],
          :email         => raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/users/@me').parsed
      end
      
      def authorize_params
        super.tap do |params|
          params[:scope] = request.params['scope']
          params[:scope] ||= DEFAULT_SCOPE
        end
      end
    end
  end
end
