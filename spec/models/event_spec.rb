require 'spec_helper'

describe Event do
  context 'validations' do

    it 'should be valid'do
      expect(build(:event)).to be_valid    
    end

    it 'should have a name' do
      expect(build(:event, name: nil)).to be_invalid 
    end

    it 'should have a date' do
      expect(build(:event, date: nil)).to be_invalid 
    end

    it 'should have a time' do
      expect(build(:event, time: nil)).to be_invalid 
    end

    it 'should have a user_id' do
      expect(build(:event, host_id: nil)).to be_invalid
    end
  end
end
