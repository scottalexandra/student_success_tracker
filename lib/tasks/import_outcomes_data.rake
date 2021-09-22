require 'csv'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/postgresql_adapter'

desc 'Import Outcomes Data'
task import_outcomes_data: :environment do
  parent_directory = Rails.root.join('db', 'data', 'outcomes_data')
  file_names = [
    '2107_student_outcomes_B1.csv',
    '2107_student_outcomes_B2.csv',
    '2107_student_outcomes_B3.csv',
    '2107_student_outcomes_F1.csv',
    '2107_student_outcomes_F2.csv',
    '2107_student_outcomes_F3.csv'
  ]

  def get_program_name(file_name)
    if file_name.slice(-6) == 'F'
      'frontend'
    elsif file_name.slice(-6) == 'B'
      'backend'
    else
      'unknown'
    end
  end


  file_names.each do |file_name, index|
    full_path = File.join(parent_directory, file_name)
    puts "Importing data from #{file_name} csvs"

    CSV.foreach(full_path, headers: true) do |row|
      mod = file_name.slice(-5)
      inning = Inning.find_or_create_by(title: file_name.first(4))
      program = get_program_name(file_name)
      student = Student.find_or_create_by(name: row["Name"], program: program, has_concerns: false)
      student.student_innings.create(outcome: row["Outcome"] , module: mod, inning_id: inning.id)
    end
  end
end
