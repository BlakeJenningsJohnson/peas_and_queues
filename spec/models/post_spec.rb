require 'spec_helper'

describe Post do
  context 'validations' do
      it 'is valid' do
        expect(build(:post)).to be valid
      end

      it 'has a title' do
        expect(build(:post, title: nil)).to be_invalid
      end

      it 'has content' do
        expect(build(:post, content: nil)).to be_invalid
      end
    end
end
