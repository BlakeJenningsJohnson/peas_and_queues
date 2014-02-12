require 'spec_helper'

describe EventsController do
    describe "GET 'index'" do
    let(:event){ create(:event) }

    it 'should be successful' do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe 'POST "create"' do
    context 'with valid attributes' do
    let(:valid_attributes) { {name: "Tool Tile", description: "Pointing out tools.", date: "2014-02-11", time: "12:30:00" } }
    before do 
      @current_user = create(:user)
      session[:user_id] = @current_user.id
    end


      it 'is a redirect' do
        post :create, event: valid_attributes
        expect(response.status).to eq 302
      end

      it 'changes event count by 1' do
        expect { post :create, event: valid_attributes }.to change(Event, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      before do 
        @current_user = create(:user)
        session[:user_id] = @current_user.id
      end
      
      it 'renders the new template' do
        post :create, event: { name: nil }
        expect(response).to render_template :new
      end

      it 'does not create a new event' do
        expect { post :create, event: { name: nil} }.to change(Event, :count).by(0)
      end
    end
  end
end

