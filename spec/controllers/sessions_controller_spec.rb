require 'spec_helper'

describe SessionsController do
   describe "GET 'create'" do
    context "when using twitter authorization" do
      context "is successful" do
        before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }

        it "redirects to home page" do
          get :create, provider: :twitter
          expect(response).to be_redirect
        end

        it "creates a user" do
          expect { get :create, provider: :twitter }.to change(User, :count).by(1)
        end

        it "assigns the @current_user var" do
          get :create, provider: :twitter
          expect(assigns(:user)).to be_an_instance_of User
        end
      end

        context 'it is not successful' do
          before { request.env["omniauth.auth"] = :invalid_credentials }
          
          it 'should not make a new user' do
            expect { get :create, provider: :twitter }.to_not change(User, :count).by(1)
          end

          it 'should redirect' do
            get :create, provider: :twitter
            
            expect(response).to be_redirect
          end
        end


      context "when the user has already signed up" do
        before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] }
        let!(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter]) }

        it "doesn't create another user" do
          get :create, provider: :twitter
          expect { get :create, provider: :twitter }.to_not change(User, :count).by(1)
        end
      end
    end
  end

  describe 'DESTROY' do
    it "should clear the session" do
      user = create(:user)
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "should redirect to the home page" do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
