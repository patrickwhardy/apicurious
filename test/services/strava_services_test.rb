require 'test_helper'
class StravaServicesTest < ActiveSupport::TestCase
  test "#activities" do
    VCR.use_cassette("strava_service#activities") do
      oauth_token = "fd14cc933a5484cc6918c6f23b20fb7e9924e02f"
      service = StravaService.new(oauth_token)
      activities = service.get_activities

      assert_equal 6, activities.count
      assert_equal "Afternoon Ride sistys", activities.last[:name]
      assert_equal Array, activities.class
    end
  end
end
