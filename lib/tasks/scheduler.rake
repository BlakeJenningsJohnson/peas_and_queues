desc "This task is called by the Heroku scheduler add-on"

task :update_weather => :environment do
  puts "Updating weather cache..."
  if Rails.env.production?
    HTTParty.get('http://peas-n-queues.herokuapp.com/weather_update')
  else
    HTTParty.get('http://localhost:3000/weather_update')
  end
  puts "The weather has been updated."
end

task :update_weather_events => :environment do
  puts "Updating event weather..."
  Event.update_weather_events
  puts "Events all have updated weather."
end

task :upcoming_event => :environment do
  puts "Sending event reminders"
  Event.event_reminder
  puts "Attendees have been reminded."
end
