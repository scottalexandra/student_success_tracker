require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "relationships" do
    it { should have_many(:student_innings) }
    it { should have_many(:innings).through(:student_innings) }
  end
end
