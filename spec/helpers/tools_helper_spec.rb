require 'spec_helper'

# How do I get this to return the right thing?
describe ToolsHelper do
  
  describe '#availability' do
    
    describe 'available tool' do
      let!(:user) { create(:user) }
      let!(:tool) { create(:tool) }

      it 'tool_response[0] should be "Available!"' do
        tool_response = helper.availability(tool.id, user)

        expect(tool_response[0]).to eq 'Available!'
      end

      it 'tool_response[1] should be "Rent it!"' do
        tool_response = helper.availability(tool.id, user)

        expect(tool_response[1]).to eq 'Rent it!'
      end

      it 'tool_response[2] should be "rent"' do
        tool_response = helper.availability(tool.id, user)

        expect(tool_response[2]).to eq 'rent'
      end
    end

    describe 'if tool is unavailable and user is not on the waitlist' do
      let!(:tool) { create(:tool, status: 'checked out') }
      let!(:user) { create(:user) }
      
      it "tool_response should be ['Not Available!', 'Get on the waitlist', 'waitlist']" do
       tool_response = helper.availability(tool.id, user)

       expect(tool_response).to match_array ['Not Available!', 'Get on the waitlist', 'waitlist']
     end
   end

   describe 'if tool is unavailable and user is already on the waitlist' do
      let!(:waitlist) { create(:waitlist_with_tool) }
      
      it "tool_response should be ['Not Available!', 'Get on the waitlist', 'waitlist']" do
       tool_response = helper.availability(tool.id, user)

       expect(tool_response).to match_array ['Not Available', 'queue']
     end
   end
  end
end