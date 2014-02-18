class Event < ActiveRecord::Base
  validates :name, :date, :time, :host_id, presence: true
  has_many  :rsvp
  has_many  :users, through: :rsvp

  def self.add_events(user, event)
    unless user.events.include? event
      user.events << event
    end
  end

  def self.update_weather_events
    Event.where(date: (Date.today)..(Date.today + 7.day)).each do |event|
      weather = WeatherReport.get_forecast(
                  'Time.new(event.date.strftime("%Y, %m, %d")')[event.time.strftime('%H').to_i]
      event.update(temperature: weather.apparentTemperature.round, conditions: weather.icon)
    end
  end
end
