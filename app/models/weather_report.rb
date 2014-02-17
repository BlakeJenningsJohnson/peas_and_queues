class WeatherReport

  def self.get_weather
    ForecastIO.forecast(47.6097, -122.3331)
  end

  def self.current_weather
    get_weather.currently
  end

  def self.get_forecast(time_arg)
    ForecastIO.forecast(47.6097, -122.3331, time: time_arg.to_i).hourly.data
  end
end
