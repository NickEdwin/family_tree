require 'rails_helper'

describe Family, type: :model do
  describe "validations" do
    it { should validate_presence_of :family_name }
    it { should validate_presence_of :family_description }
  end

  describe "relationships" do
    it {should have_many :family_members}
  end
end
