class City < ApplicationRecord
has_many :enrollments, dependent: :destroy

validates :city_name, length: { maximum: 100 }, presence: true
end
