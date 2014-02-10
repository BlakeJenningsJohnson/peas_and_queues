require 'spec_helper'

describe Tool do
  context 'validations' do
    it 'is valid' do
      expect(build(:tool)).to be valid
    end

    it 'has a name' do
      expect(build(:tool, name: nil)).to be_invalid
    end
  end
end
