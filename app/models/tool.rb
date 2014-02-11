class Tool < ActiveRecord::Base
  validates :name, presence: true
end
