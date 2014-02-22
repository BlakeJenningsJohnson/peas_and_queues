require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ToolsHelper. For example:
#
# describe ToolsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

# How do I get this to return the right thing?
describe ToolsHelper do
  describe '#availability' do
    let(:user) { create(:user) }
    let(:tool) { create(:tool) }

    it 'should return "available" if the tool status == available' do
      helper.availability(tool.id, user.id)

      expect(assigns(:availability)).to eq 'Available!'
    end

    it 'should return "That tool is here for you!" when the tool is on hold and has the user.id' do
      tool.update(status: 'on hold')
      tool.update(user_id: user.id)
      helper.availability(tool.id, user.id)

      expect(assigns(:availability)).to eq 'That tool is here for you!'
    end

    it "should return You've GOT this tool! when the user has the tool" do
      tool.update(status: 'checked out')
      tool.update(user_id: user.id)
      helper.availability(tool.id, user.id)

      expect(assigns(:availability)).to eq "You've GOT this tool!"
    end

    it "should return 'Not Available!' if the tool is checked out and not belonging to the user" do
      tool.update(status: 'checked out')
      helper.availability(tool.id, user.id)

      expect(assigns(:availability)).to eq 'Not Available!'
    end
  end
end




# <% if current_user %>
#           <% if tool.status == 'available' || (tool.status == 'on hold' && tool.user_id == current_user.id) %> 
#             <%= link_to "Rent It", rent_path(tool.id), method: 'patch' %>
#           <% elsif tool.user_id == current_user.id %>
#               <%= link_to "Return It", return_path(tool.id), method: 'patch' %>
#           <% elsif (tool.users.where(id: current_user.id).count == 1) %>
#                You are currently #<%= Waitlist.place_in_waitlist(current_user.id, tool.id) %> in the queue! We'll shoot you an email when you're number one. 
#           <% elsif tool.user_id != current_user.id %> 
              
#                 <%= form_for @waitlist do |f| %>
#                 <%= f.hidden_field :tool_id, value: tool.id %>
#                 <%= f.hidden_field :user_id, value: current_user.id %>
#                 <%= f.submit 'Add Your Name to the Waitlist.' %>
#                 <% end %>
#           <% end %>
#         <% else %>
#           <%= link_to "Sign in to rent a tool", '/auth/twitter' %>
#         <% end %>