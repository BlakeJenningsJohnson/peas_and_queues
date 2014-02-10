require 'spec_helper'

describe UsersController do
  describe "GET 'show'" do
    let(:user) { create(:user) }
    
    it 'should work' do
      get :show, id: user.id
      expect(response.status).to eq 200
    end

    it 'should be that user' do 
      user1 = create(:user1)
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end
  end
end
