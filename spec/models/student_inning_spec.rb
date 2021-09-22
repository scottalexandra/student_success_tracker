require 'rails_helper'

RSpec.describe StudentInning, type: :model do
  describe "relationships" do
    it { should belong_to :student }
    it { should belong_to :inning }
  end
end
