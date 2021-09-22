class CreateStudentInnings < ActiveRecord::Migration[5.2]
  def change
    create_table :student_innings do |t|
      t.references :student, foreign_key: true
      t.references :inning, foreign_key: true
      t.integer :week_one
      t.integer :week_two
      t.integer :week_three
      t.integer :week_four
      t.integer :week_five
      t.string :notes
      t.string :outcome
      t.integer :module

      t.timestamps
    end
  end
end
