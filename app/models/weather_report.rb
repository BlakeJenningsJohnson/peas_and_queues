class WeatherReport

  def self.get_weather
    # cache('weather_report', expires_in: 1.hour) do
      ForecastIO.forecast(47.6097, -122.3331)
    # end
  end

  def self.current_weather
    get_weather.currently
  end

  def self.get_forecast(time_arg)
    ForecastIO.forecast(47.6097, -122.3331, time: Time.new(time_arg).to_i)
  end

end

# WeatherReport.get_weather