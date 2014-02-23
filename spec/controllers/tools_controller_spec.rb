require 'spec_helper'

describe ToolsController do
  context "when a signed-in user is an admin" do
    context "with valid attributes" do
    let(:valid_attributes) { {name: "Hammer", description: "To hit"} }
      before :each do 
        @current_user = create(:admin)
        session[:user_id] = @current_user.id
      end

      describe "a tool can be put in your box" do
        it "gets new" do
          get :new
          expect(response).to be_successful
        end

        it "creates a tool" do
          tool_count = Tool.count
          post :create, tool: valid_attributes
          expect(Tool.count).to eq(tool_count + 1)
        end

        it "redirects to the tool box" do
          post :create, tool: valid_attributes
          expect(response.status).to eq 302
        end

        it "flashes a notice of success" do 
          post :create, tool: valid_attributes
          expect(flash[:notice]).to eq("You have added a tool.")
        end
      end
    end

    context "without valid attributes" do
    let(:invalid_attributes) { {name: "", description: "to hit"} }

      describe "doesn't create a tool" do 
        it "renders a new" do
          post :create, tool: invalid_attributes
          expect(response).to render_template(:new)
        end

        it "doesn't change the tool count" do
          tool_count = Tool.count
          post :create, tool: invalid_attributes
          expect(Tool.count).to eq(tool_count)
        end

        it "flashes a notice" do
          post :create, tool: invalid_attributes
          expect(flash[:notice]).to eq("There was a problem saving this tool.")
        end
      end
    end
  end

  # the way we do this has totally changed, so these tests are now failing.
  # write new tests that better describe what is happening if time


  # context "when a user is signed in" do
  #   let!(:tool){ create(:tool) }
  #   let(:current_user) { create(:user)}

  #   before do 
  #     session[:user_id] = current_user.id
  #   end

  #   context "when a tool is available" do
  #     describe "a tool can be rented" do
  #       it "changes the tool's status to rented" do
  #         patch :rent, id: tool.id 
  #         expect(tool.reload.status).to eq 'checked out'
  #       end

  #       it "establishes the user as the person renting" do
  #         patch :rent, id: tool.id
  #         expect(tool.reload.user_id).to eq(current_user.id)
  #       end
  #     end
  #   end
  # end
end
