class WeatherReport

  def self.get_weather
    # cache('weather_report', expires_in: 1.hour) do
      ForecastIO.forecast(47.6097, 122.3331)
    # end
  end
end

# WeatherReport.get_weather