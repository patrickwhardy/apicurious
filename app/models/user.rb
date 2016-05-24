class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid          = auth_info.uid
      user.first_name   = auth_info.extra.raw_info.firstname
      user.last_name    = auth_info.extra.raw_info.lastname
      user.avatar       = auth_info.extra.raw_info.profile
      user.oauth_token  = auth_info.credentials.token
    end
  end
end
