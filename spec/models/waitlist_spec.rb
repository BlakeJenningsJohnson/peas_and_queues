require 'spec_helper'

describe Waitlist do
  let!(:line_in_waitlist) { create(:waitlist) } 
  let!(:line_in_waitlist1) { create(:waitlist1) }
  let!(:line_in_waitlist2) { create(:waitlist2) }

  context 'update_waitlist' do
    describe 'find_who_is_next' do
      it 'finds the waitlist for a particular tool' do
        result = Waitlist.find_who_is_next(1)

        expect(result).to eq line_in_waitlist
      end
    end

    describe 'tool_hold' do
      it 'puts the tool on hold' do
        waitlist = create(:waitlist_with_tool)
        waitlist.tool_hold

        expect(waitlist.tool.status).to eq 'on hold'
      end
    end

    describe 'update_user' do
      it 'updates the tool user so that the correct user can pick it up' do
        waitlist = create(:waitlist_with_tool)
        waitlist.update_user

        expect(waitlist.tool.user_id).to eq waitlist.user.id
      end
    end

    # describe 'email_user' do
      
    #   before(:each) do
    #     ActionMailer::Base.delivery_method = :test
    #     ActionMailer::Base.perform_deliveries = true
    #     ActionMailer::Base.deliveries = []
    #   end
    #   after(:each) do
    #     ActionMailer::Base.deliveries.clear
    #   end

    #   it 'emails the user so they know to pick their tool up' do
    #     line_in_waitlist.email_user
        
    #     expect(ActionMailer::Base.deliveries.count).to eq 1
    #   end

    #   it 'should set the email address to the correct email' do
    #     line_in_waitlist.email_user

    #     expect(ActionMailer::Base.deliveries.first.email).to eq 'davida@davidamail.com'
    #   end
    # end

  end
end
