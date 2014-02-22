require 'spec_helper'

describe WeatherHelper do
  describe '#weather_icon' do
    
    it 'should return clear_day.png when icon is clear-day' do
      expect(helper.weather_icon('clear-day')).to eq 'clear_day.png'
    end

    it 'should return clear_night.png when icon is clear-night' do
      expect(helper.weather_icon('clear-night')).to eq 'clear_night.png'
    end

    it 'should return rain.png when icon is rain' do
      expect(helper.weather_icon('rain')).to eq 'rain.png'
    end

    it 'should return snow.png when icon is snow' do
      expect(helper.weather_icon('snow')).to eq 'snow.png'
    end

    it 'should return sleet.png when icon is sleet' do
      expect(helper.weather_icon('sleet')).to eq 'sleet.png'
    end

    it 'should return wind.png when icon is wind' do
      expect(helper.weather_icon('wind')).to eq 'wind.png'
    end

    it 'should return fog.png when icon is fog' do
      expect(helper.weather_icon('fog')).to eq 'fog.png'
    end

    it 'should return cloudy.png when icon is cloudy' do
      expect(helper.weather_icon('cloudy')).to eq 'cloudy.png'
    end

    it 'should return partly-cloudy-night.png when icon is partly-cloudy-night' do
      expect(helper.weather_icon('partly-cloudy-night')).to eq 'partly_cloudy_night.png'
    end

    it 'should return partly_cloudy_day.png when icon is partly_cloudy_day' do
      expect(helper.weather_icon('partly-cloudy-day')).to eq 'partly_cloudy_day.png'
    end

  end
end


  # module WeatherHelper
  # def weather_icon(icon)
  #   image = case icon
  #   when 'clear-day'            then 'clear_day.png'
  #   when 'clear-night'          then 'clear_night.png'
  #   when 'rain'                 then 'rain.png'
  #   when 'snow'                 then 'snow.png'
  #   when 'sleet'                then 'sleet.png'
  #   when 'wind'                 then 'wind.png'
  #   when 'fog'                  then 'fog.png'
  #   when 'cloudy'               then 'cloudy.png'
  #   when 'partly-cloudy-day'    then 'partly_cloudy_day.png'
  #   when 'partly-cloudy-night'  then 'partly_cloudy_night.png'
  #   end
  #   image
  # end
# end