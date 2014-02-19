class Tool < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :waitlist
  has_many :users, through: :waitlist
end
