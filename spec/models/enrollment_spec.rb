require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  before(:each) do
    @user = User.create!(username: 'admin', email: 'admin@hotmail.com', password: '123_456')
    @course = Course.create!(name: 'rails', description: 'Learning fast rails', max_num_students: 20, user_id: @user.id)
    @city = City.create!(city_name: 'Mexico')
    @enrollment = Enrollment.create!(sign_up_date: Date.today, course_id: @course.id, user_id: @user.id,
                                     city_id: @city.id)
  end

  describe 'When the enrollment model is tested' do
    it 'validates the sign_up_date of the object' do
      expect(@enrollment.sign_up_date).to eq Date.today
    end
  end

  describe 'When enrollment model wants to be save it' do
    it 'is valid with valid attributes' do
      expect(@enrollment).to be_valid
    end

    it 'is not valid without an email' do
      enrollment = Enrollment.new(sign_up_date: nil)
      expect(enrollment).to_not be_valid
    end
  end
end
