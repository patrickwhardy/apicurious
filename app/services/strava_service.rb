class StravaService
  def initialize(user_token)
    @connection = Faraday.new(url: "https://www.strava.com/api/v3/")
    @connection.headers["Authorization"] = "Bearer #{user_token}"
  end

  def get_activities
    JSON.parse(@connection.get('athlete/activities').body, symbolize_names: true)
  end
end
