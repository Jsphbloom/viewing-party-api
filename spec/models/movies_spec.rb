require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "validations" do
    it { should validate_presence_of(:id) }
  end
end