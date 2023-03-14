class Teacher < ApplicationRecord
    has_many :courses, dependent: :destroy
    validates :last_name, length: { maximum: 100 }, presence: true
    validates :name, length: { maximum: 100 }, presence: true
    validates :degree, length: { maximum: 100 }, presence: true
end
