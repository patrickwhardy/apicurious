require "test_helper"
class UserSeesActivityTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  test "log in and view activity" do
    visit "/"
    click_link "Sign in with Strava"
    click_link "Afternoon Ride sistys"
    assert_equal "/activities/585724446", current_path
    assert page.has_content?("Distance(m): 22495.7")
  end
end
