require 'spec_helper'

describe Waitlist do
  # let!(:user) { create(:user) }
  # let!(:user1) { create(:user1) }
  # let!(:tool) { create(:tool) }
  # let!(:tool1) { create(:tool2) }
  let!(:line_in_waitlist) { create(:waitlist) } 
  let!(:line_in_waitlist1) { create(:waitlist1) }
  let!(:line_in_waitlist2) { create(:waitlist2) }

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

  describe '#update_waitlist' do

    it 'finds the waitlist for the appropriate tool' do
      Waitlist.update_waitlist(1)
    end

    # it "should email the person on the top of that tool's waitlist" do
    # end

    # it "should remove the line on the top of that tool's waitlist" do
    #   Waitlist.update_waitlist(2)
    # end

    # it "should not remove any other tool's line" do
    # end
  end
end
