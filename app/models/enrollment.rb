class Enrollment < ApplicationRecord
belongs_to :course
belongs_to :user
belongs_to :city

end
