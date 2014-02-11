class User < ActiveRecord::Base

  def self.find_or_create_from_omniauth(auth_hash)
    user = User.find_by(uid: auth_hash["uid"]) || create_from_omniauth(auth_hash)
    # user.update(token:         auth_hash["credentials"]["token"],
    #             secret:  auth_hash["credentials"]["secret"])
    # user
  end

  def self.create_from_omniauth(auth_hash)
    user = self.create(
      uid:      auth_hash["uid"],
      provider: auth_hash["provider"],
      avatar:   auth_hash["info"]["image"],
      name:     auth_hash["info"]["nickname"],
      # token:    auth_hash["credentials"]["token"],
      # secret:   auth_hash["credentials"]["secret"]
    )
    if user.valid? 
      user
    else
      nil
    end
  end
end
