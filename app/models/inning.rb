class Inning < ApplicationRecord
  has_many :student_innings
  has_many :students, through: :student_innings
end
