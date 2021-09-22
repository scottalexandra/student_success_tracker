require 'rails_helper'

describe "Inning Index Page" do
  it "displays student success data " do
    inning1 = Inning.create!(title: "2105")
    inning2 = Inning.create!(title: "2107")

    student1 = Student.create!(name: "Shirley Anne Jackson", program: "backend", has_concerns: false)
    student2 = Student.create!(name: "Lilly Smith", program: "backend", has_concerns: false)
    student3 = Student.create!(name: "John Richards", program: "backend", has_concerns: false)
    student4 = Student.create!(name: "Zachariah Samuels", program: "backend", has_concerns: false)

    StudentInning.create!(student_id: student1.id, inning_id: inning1.id, module: 1, outcome: "Repeat")
    StudentInning.create!(student_id: student2.id, inning_id: inning1.id, module: 2, outcome: "Left for Leave/Audit During Mod")
    StudentInning.create!(student_id: student3.id, inning_id: inning1.id, module: 2, outcome: "Repeat")
    StudentInning.create!(student_id: student4.id, inning_id: inning1.id, module: 3, outcome: "Repeat")

    StudentInning.create!(student_id: student1.id, inning_id: inning2.id, module: 1, outcome: "Dismissed")
    StudentInning.create!(student_id: student3.id, inning_id: inning2.id, module: 2, outcome: "Dismissed")
    StudentInning.create!(student_id: student4.id, inning_id: inning2.id, module: 3, outcome: "Left for Leave/Audit During Mod")

    visit root_path

    within(first(".outcomes")) do
      expect(page).to have_content("Inning: 2105")
      expect(page).to have_content("Currently On Leave: 1")
      expect(page).to have_content("Dismissed: 0")
      expect(page).to have_content("Repeated: 3")
    end

    # within('.inning_2107') do
    #   expect(page).to have_content("Inning: 2107")
    #   expect(page).to have_content("Currently On Leave: 1")
    #   expect(page).to have_content("Dismissed: 2")
    #   expect(page).to have_content("Repeated: 0")
    # end
  end
end
