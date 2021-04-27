require 'rails_helper'

describe Family, type: :model do
  describe "validations" do
    it { should validate_presence_of :family_name }
    it { should validate_presence_of :family_description }
  end

  describe "relationships" do
    it {should have_many :family_members}
  end

  describe 'objects' do
    before(:each) do
      @family1 = Family.create!(family_name: "Edwin",
                                family_description: "A noble and wise family.")
      @family2 = Family.create!(family_name: "Smith",
                                family_description: "Generic family in America")
    end

    it "can create new families in the db" do
      first = Family.first
      second = Family.last

      expect(first.family_name).to eq("Edwin")
      expect(second.family_name).to eq("Smith")
    end
  end
end
