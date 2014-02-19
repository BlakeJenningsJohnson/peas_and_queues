class Tool < ActiveRecord::Base
  validates :name, presence: true
  has_many :waitlists
  has_many :users, through: :waitlist
end
