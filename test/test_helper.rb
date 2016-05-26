ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require "minitest/rails/capybara"
require 'webmock'
require 'vcr'


class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |c|
    c.cassette_library_dir = 'test/cassettes'
    c.hook_into :webmock
    c.allow_http_connections_when_no_cassette = true
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:strava] = OmniAuth::AuthHash.new({
      provider: 'strava',
      uid: "15379571",
      extra: {
        raw_info: {
          firstname: "Patrick",
          lastname: "Hardy",
          profile: "https://graph.facebook.com/v2.1/1572780499/picture?height=256&width=256"
        }
      },
      credentials: {
        token: "fd14cc933a5484cc6918c6f23b20fb7e9924e02f"
      }
    })
  end
end
