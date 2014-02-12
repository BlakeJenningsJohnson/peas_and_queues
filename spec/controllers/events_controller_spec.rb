require 'spec_helper'

describe EventsController do
    describe "GET 'index'" do

    let(:event){ create(:event) }

    it 'should be successful' do
      get :index
      expect(response.status).to eq 200
    end

    it 'should load the event into @events' do 
     
    end
  end

end
