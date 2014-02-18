class WelcomeController < ApplicationController
  before_action :all_posts

  def weather_report
    Rails.cache.write('weather_report', 
                      WeatherReport.current_weather, 
                      time_to_idle: 60.seconds, 
                      timeToLive: 600.seconds)
  end

  def index
    set_weather
    @quote          = HTTParty.get(
                        'http://quotesonhorticulture.com/js-api.php').parsed_response.split(
                        "<p id='qoh-text'>")[1].split("<")[0]
    @events         = Event.where(
                        date: (Time.now.midnight - 1.day)..(Time.now.midnight + 1.week)).order(
                        'date ASC').limit(3)
  end

  private

  def set_weather
    if Rails.cache.read('weather_report').nil?
      weather_report
    end

    @weather_report = Rails.cache.read('weather_report')
  end
end