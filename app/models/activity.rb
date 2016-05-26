class Activity < OpenStruct
  def self.service(user_token)
    StravaService.new(user_token)
  end

  def self.all(user_token)
    service(user_token).get_activities.map { |activity_hash| Activity.new(activity_hash) }
  end

  def self.find(user_token, activity_id)
    all(user_token).find { |activity| activity.id.to_s == activity_id }
  end

  def set_waypoints
    polyline = self[:map][:summary_polyline]
    waypoints = Polylines::Decoder.decode_polyline(polyline)
    waypoints.map { |lat, lng| { lat: lat, lng: lng } }
  end
end
