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
describe ToolsHelper do
  describe 'availability' do
    let(:user) { create(:user) }
    let(:tool) { create(:tool) }

    it 'should return "available" if the tool status == available' do
      expect(helper.availability(tool.id, user.id)).to eq 'Available!'
    end

    it 'should return "That tool is here for you!" when the tool is on hold and has the user.id' do
      tool.update(status: 'on hold')
      tool.update(user_id: user.id)

      expect(helper.availability(tool.id, user.id)).to eq 'That tool is here for you!'
    end
  end

  
end




 # tool = Tool.find(tool_id)
 #    if tool.status == 'available'
 #      @response = 'Available!'
 #    elsif tool.status == 'on hold' && user_id == tool.user_id
 #      @reponse = 'That tool is here for you!'
 #    elsif user_id == tool.user_id
 #      @response  = "You've GOT this tool!"
 #    else
 #      @response = 'Not Available!'
 #    end