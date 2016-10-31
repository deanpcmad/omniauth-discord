require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Discord < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'identify'

      option :name, 'discord'

      option :client_options, {
        :site          => 'https://discordapp.com/api',
        :authorize_url => 'oauth2/authorize',
        :token_url     => 'oauth2/token'
      }

      option :authorize_options, [:scope]

      uid { raw_info['id'] }

      info do
        {
          :id            => raw_info['id'],
          :username      => raw_info['username'],
          :discriminator => raw_info['discriminator'],
          :avatar        => raw_info['avatar'],
          :verified      => raw_info['verified']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info = access_token.get('users/@me').parsed
      end

      def callback_url
        # Discord does not support query parameters
        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |option|
            params[option] = request.params[option.to_s] if request.params[option.to_s]
          end

          params[:redirect_uri] = options[:redirect_uri] unless options[:redirect_uri].nil?
          params[:scope] ||= DEFAULT_SCOPE
        end
      end
    end
  end
end
