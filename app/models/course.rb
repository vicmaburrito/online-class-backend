class Course < ApplicationRecord
belongs_to :teacher
has_many :schedules, dependent: :destroy
has_many :enrollments, dependent: :destroy
end
