class User < ActiveRecord::Base
  validates :name, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :provider, presence: true
  validates :phone,
            uniqueness: true, 
            format: { with: /\d/ },
            length: { is: 10, message: "must be at least ten numbers" },
            allow_nil: true
  validates :email, uniqueness: true, 
            format: {with: /@/, message: "is not a valid address"}, 
            allow_nil: true

  has_many :rsvp
  has_many :events, through: :rsvp
  has_many :comments

  has_many :waitlists
  has_many :tools, through: :waitlists

  has_many :posts

  def self.find_or_create_from_omniauth(auth_hash)
    user = User.find_by(uid: auth_hash["uid"]) || create_from_omniauth(auth_hash)
    return user
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
