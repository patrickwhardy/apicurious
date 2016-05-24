require "test_helper"
class UserLogsInWithStravaTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Sign in with Strava"
    assert_equal "/", current_path
    assert page.has_content?("Patrick Hardy")
    assert page.has_link?("Logout")
  end

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
