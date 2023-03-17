require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(username: 'admin', email: 'admin@hotmail.com', password: '123_456')
    @course = Course.new(name: 'ruby', description: 'Learning fast ruby', max_num_students: 20, user_id: @user.id)
  end

  describe 'When the course model is test' do
    it 'validates the presence fields of the object' do
      expect(@course.name).to eq 'ruby'
      expect(@course.description).to eq 'Learning fast ruby'
      expect(@course.max_num_students).to eq 20
      expect(@course.user_id).to eq @user.id
    end
  end

  describe 'When course model wants to be save it' do
    it 'is valid with valid attributes' do
      expect(@course).to be_valid
    end

    it 'is not valid without an name' do
      course = Course.new(name: nil)
      expect(course).to_not be_valid
    end
    it 'is not valid without an description' do
      course = Course.new(description: nil)
      expect(course).to_not be_valid
    end
    it 'is not valid without an max num students' do
      course = Course.new(max_num_students: nil)
      expect(course).to_not be_valid
    end
    it 'is not valid without an user id' do
      course = Course.new(user_id: nil)
      expect(course).to_not be_valid
    end
  end
end
