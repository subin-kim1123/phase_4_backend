class Student < ApplicationRecord
  belongs_to :teacher
  has_many :student_goals
  has_many :goals, through: :student_goals
end
