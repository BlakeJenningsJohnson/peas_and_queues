require 'spec_helper'

describe WaitlistsController do
  context "when a user is signed in" do
    let!(:tool){ create(:tool) }
    let(:current_user) { create(:user)}

    before do 
      session[:user_id] = current_user.id
    end

    context "when a tool is already checked out" do 
      describe "a user can get on the waitlist" do
        it "creates a new waitlist position" do
          waitlist_count = Waitlist.count
          post :create, waitlist: { user_id: current_user.id, tool_id: tool.id }

          expect(Waitlist.count).to eq(waitlist_count + 1)
        end 

        it "adds the correct user and tool id to waitlist" do
          post :create, waitlist: { user_id: current_user.id, tool_id: tool.id }

          expect(assigns(:waitlist).user_id).to eq(current_user.id)
          expect(assigns(:waitlist).tool_id).to eq(tool.id)
        end
      end
    end
  end
end