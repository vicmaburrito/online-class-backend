require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(username: 'admin', email: 'admin@hotmail.com', password: '123_456')
  end

  describe 'When the user model is tested' do
    it 'validates the name of the object' do
      expect(@user.username).to eq 'admin'
    end
  end

  describe 'When user model wants to be save it' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end
  end
end
