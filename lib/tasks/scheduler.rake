desc "This task is called by the Heroku scheduler add-on"

# task :update_weather => :environment do
#   puts "Updating weather..."
#   WeatherReport.current_weather
#   puts "done."
# end

task :update_weather_events => :environment do
  puts "Updating event weather..."
  Event.update_weather_events
  puts "Events all have updated weather."
end
