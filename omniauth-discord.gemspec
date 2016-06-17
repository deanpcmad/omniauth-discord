# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/discord/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-discord"
  spec.version       = Omniauth::Discord::VERSION
  spec.authors       = ["Adão Raul"]
  spec.email         = ["adao.raul@gmail.com"]

  spec.summary       = "Discord OAuth2 Strategy for OmniAuth"
  spec.description   = spec.summary
  spec.homepage      = "http://github.com/adaoraul/omniauth-discord"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.4'

  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-utils"
  spec.add_development_dependency "mocha"
end
