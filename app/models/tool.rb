class Tool < ActiveRecord::Base
  validates :name, presence: true
  has_many :waitlists
  has_many :users, through: :waitlists

  def available?
    if self.status == 'available'
      true
    else
      false
    end
  end
end
