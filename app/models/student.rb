class Student < ApplicationRecord
  has_many :student_innings
  has_many :innings, through: :student_innings
end
