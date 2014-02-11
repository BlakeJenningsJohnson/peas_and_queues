class WelcomeController < ApplicationController

  def index
    @quote = HTTParty.get('http://quotesonhorticulture.com/js-api.php').parsed_response.split("<p id='qoh-text'>")[1].split("<")[0]
  end
end
