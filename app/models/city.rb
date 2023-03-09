class City < ApplicationRecord
has_many :enrollments, dependent: :destroy
end
