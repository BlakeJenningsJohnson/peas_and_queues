ENV['REDISTOGO_URL'] ||= "redis://username:password@host:6379/"

# if Rails.env.production? 
#   uri = URI.parse(ENV['REDISTOGO_URL'])
#   Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# elsif Rails.env.development?
#   Resque.redis = Redis.new(:host => 'localhost', :port => '6379')
# end

if Rails.env.development?
  Redis.current = Redis.new
elsif Rails.env.test?
  Redis.current = Redis.new
elsif Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Redis.current = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end