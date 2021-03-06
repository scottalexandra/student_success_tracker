class Inning < ApplicationRecord
  has_many :student_innings
  has_many :students, through: :student_innings

  def currently_on_leave
    student_innings.where("outcome = ?", "Left for Leave/Audit During Mod").count
  end

  def repeated
    student_innings.where("outcome = ?", "Repeat").count
  end

  def dismissed
    student_innings.where("outcome = ?", "Dismissed").count
  end
end
