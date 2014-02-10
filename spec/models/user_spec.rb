require 'spec_helper'

describe User do
  context 'as a boring dumb user' do
    context 'validations' do
      it 'is valid' do
        expect(build(:user)).to be valid
      end

      it 'has a name' do
        expect(build(:user, name: nil)).to be_invalid
      end

      it 'has a uid' do
        expect(build(:user, uid: nil)).to be_invalid
      end

      it 'has a provider' do
        expect(build(:user, provider: nil)).to be_invalid
      end
    end
    
    context 'optional fields' do
      it 'has an email address that is valid' do

        expect(build(:user, email: 'davida')).to be_invalid
        expect(build(:user, email: 'davida@davida.com')).to be_valid
      end

      it 'if it has an email, it has a unique email' do
        create(:user, email: 'blake@blake.com')
        
        expect(build(:user1, email: 'blake@blake.com')).to be_invalid
      end

      it 'has a phone number that is valid' do

        expect(build(:user, phone: 'davida')).to be_invalid
        expect(build(:user, phone: '9144208923')).to be_valid
      end

      it 'if it has a number, it has a unique number' do
        create(:user, phone: '9144208923')
        
        expect(build(:user1, phone: '9144208923')).to be_invalid
      end
    end
  end
end
