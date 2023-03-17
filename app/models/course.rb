class Course < ApplicationRecord
belongs_to :user
has_many :enrollments, dependent: :destroy

validates :name, length: { maximum: 100 }, presence: true
validates :description, presence: true
validates :max_num_students, presence: true
validates :user_id, presence: true
end
