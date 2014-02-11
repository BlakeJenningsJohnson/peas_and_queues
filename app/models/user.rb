class User < ActiveRecord::Base
  validates :name, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :provider, presence: true
  validates :phone, 
            format: { with: /\d/ },
            length: { is: 10, message: "must be at least ten numbers" },
            allow_nil: true
  validates :email, uniqueness: true, 
            format: {with: /@/, message: "is not a valid address"}, 
            allow_nil: true

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
