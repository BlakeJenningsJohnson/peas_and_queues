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

  
  describe 'POST "update"' do
    context 'user is updating their own event'
      before do 
          @current_user = create(:user)
          session[:user_id] = @current_user.id
        end
      let(:event){ create(:event) }

      it 'does update' do
        patch :update, id: 1, event: { name: 'Weeding Party'}

        expect(event.name).to eq('Weeding Party')
      end
    end

    context "user is trying to update someone else's event" do
      before do 
          @current_user = create(:user)
          session[:user_id] = @current_user.id
        end
      let(:event1){ create(:event1) }

      it 'does not update' do
        patch :update, id: 1, event: { name: 'Weeding Party' }

        expect(event1.name).to be('Tool Time')
      end
    end

    # it 'does update params' do
    #   patch :update, id: 1, nerd: {
    #                                     name: 'davida1'
    #                                   }

    #   expect(nerd.name).to eq('davida1')
    # end


  
end

