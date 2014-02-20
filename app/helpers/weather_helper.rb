module WeatherHelper
  def weather_icon(icon)
    image = case icon
    when 'clear-day'            then 'clear_day.png'
    when 'clear-night'          then 'clear_night.png'
    when 'rain'                 then 'rain.png'
    when 'snow'                 then 'snow.png'
    when 'sleet'                then 'sleet.png'
    when 'wind'                 then 'wind.png'
    when 'fog'                  then 'fog.png'
    when 'cloudy'               then 'cloudy.png'
    when 'partly-cloudy-day'    then 'partly_cloudy_day.png'
    when 'partly-cloudy-night'  then 'partly_cloudy_night.png'
    end
    image
  end
end