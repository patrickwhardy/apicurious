describe 'StravaService', :vcr do
    it "gets user's activities" do
      oauth_token = "fd14cc933a5484cc6918c6f23b20fb7e9924e02f"
      service = StravaService.new(oauth_token)
      activities = service.get_activities

      assert_equal 6, activities.count
      assert_equal "Afternoon Ride sistys", activities.last[:name]
      assert_equal Array, activities.class
    end
end
