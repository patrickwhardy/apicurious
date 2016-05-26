require "test_helper"
class UserLogsInWithStravaTest < ActionDispatch::IntegrationTest
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
end
