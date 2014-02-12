class Event < ActiveRecord::Base
  validates :name, :date, :time, :host_id, presence: true
  has_many :rsvp
  has_many :users, through: :rsvp

  def self.add_events(user, event)
    unless user.events.include? event
      user.events << event
    end
  end
end
