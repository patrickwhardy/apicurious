require "test_helper"
class UserLogsInWithStravaTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Apicurious::Application
    # user = User.new({uid: "15379571"})
    # user.oauth_token = "fd14cc933a5484cc6918c6f23b20fb7e9924e02f"
    # ApplicationController.any_instance.stubs(:current_user).returns(user)
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
end
