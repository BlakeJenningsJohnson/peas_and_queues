class WelcomeController < ApplicationController
  before_action :weather_report, :all_posts

  def index
    @quote          = HTTParty.get(
                        'http://quotesonhorticulture.com/js-api.php').parsed_response.split(
                        "<p id='qoh-text'>")[1].split("<")[0]
    @events         = Event.where(
                        date: (Time.now.midnight - 1.day)..(Time.now.midnight + 1.week)).order(
                        'date ASC').limit(3)  
  end
end