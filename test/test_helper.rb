ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
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
