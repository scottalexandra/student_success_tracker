require 'rails_helper'

RSpec.describe Inning, type: :model do
  describe "relationships" do
    it { should have_many :student_innings }
    it { should have_many(:students).through(:student_innings) }
  end
end
