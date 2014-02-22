require 'spec_helper'

describe Tool do
  context 'validations' do
    it 'is valid' do
      expect(build(:tool)).to be_valid
    end

    it 'has a name' do
      expect(build(:tool, name: nil)).to be_invalid
    end
  end

  context 'rent-return-queue' do
    let!(:tool) { create(:tool) }

    describe 'rent' do
      it '#rent without a waitlist' do
        tool.rent

        expect(tool.status).to eq('checked out')
      end

      it '#rent with a waitlist' do
        waitlist = create(:waitlist_with_tool)
        waitlist_count = Waitlist.count
        tool = waitlist.tool
        tool.rent

        expect(Waitlist.count).to eq(waitlist_count - 1)
        expect(tool.status).to eq('checked out')
      end
    end

    describe 'return' do
      it '#return without a waitlist' do
        tool.return

        expect(tool.status).to eq('available')
        expect(tool.user_id).to be_nil
      end

      it '#return with a waitlist' do
        waitlist = create(:waitlist_with_tool)
        tool = waitlist.tool
        tool.return
        
        expect(tool.reload.status).to eq('on hold')
        expect(tool.reload.user_id).to eq(waitlist.user_id)
      end
    end

    describe 'class method rent-return-queue' do
      let!(:user) { create(:user) }

      it 'should rent a tool if the action is rent' do
        Tool.rent_return_queue(tool.id, user.id, 'rent')

        expect(tool.reload.status).to eq 'checked out'
      end

      it 'should return a tool if the action is return' do
        Tool.rent_return_queue(tool.id, user.id, 'return')

        expect(tool.reload.status).to eq 'available'
        expect(tool.reload.user_id).to be_nil
      end

      it 'should return create a new waitlist line if the action is waitlist' do
        waitlist_count = Waitlist.count
        Tool.rent_return_queue(tool.id, user.id, 'waitlist')

        expect(Waitlist.count).to eq(waitlist_count + 1)
      end
    end 
  end
end
