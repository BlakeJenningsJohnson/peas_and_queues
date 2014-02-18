desc "This task is called by the Heroku scheduler add-on"

task :update_weather => :environment do
  puts "Updating weather cache..."
  if Rails.env.production?
    response = HTTParty.get('http://peas-n-cukes.herokuapp.com/weather_update')
  else
    response = HTTParty.get('http://localhost:3000/weather_update')
  end
  puts "The weather has been updated. #{response}"
end

task :update_weather_events => :environment do
  puts "Updating event weather..."
  Event.update_weather_events
  puts "Events all have updated weather."
end
