require 'rails_helper'

RSpec.describe City, type: :model do
  before(:each) do
    @city = City.new(city_name: 'Mexico')
  end

  describe 'When the city model is tested' do
    it 'validates the name of the object' do
      expect(@city.city_name).to eq 'Mexico'
    end
  end

  describe 'When user model wants to be save it' do
    it 'is valid with valid attributes' do
      expect(@city).to be_valid
    end

    it 'is not valid without an city name' do
      city = City.new(city_name: nil)
      expect(city).to_not be_valid
    end
  end
end
