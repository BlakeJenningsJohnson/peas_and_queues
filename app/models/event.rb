class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
