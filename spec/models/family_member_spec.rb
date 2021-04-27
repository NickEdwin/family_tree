require 'rails_helper'

describe FamilyMember, type: :model do
  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :date_of_birth }
    it { should validate_presence_of :date_of_death }
    it { should validate_presence_of :place_of_birth }
  end

  describe "relationships" do
    it {should belong_to :family}
  end

  describe 'objects' do
    before(:each) do
      @family1 = Family.create!(family_name: "Edwin",
                                family_description: "A noble and wise family.")
      @family2 = Family.create!(family_name: "Smith",
                                family_description: "Generic family in America")
      @fam_member1 = @family1.family_members.create!(first_name: "Nick",
                                                     last_name: "Edwin",
                                                     gender: "Male",
                                                     date_of_birth: "5/27/1985",
                                                     date_of_death: "n/a",
                                                     place_of_birth: "Staten Island, NY")
      @fam_member2 = @family2.family_members.create!(first_name: "Jane", 
                                                     last_name: "Smith",
                                                     gender: "Female",
                                                     date_of_birth: "1/01/1991",
                                                     date_of_death: "n/a",
                                                     place_of_birth: "Staten Island, NY")
    end

    it "can create new family members in the db" do
      person1 = @family1.family_members.first
      person2 = @family2.family_members.first

      expect(person1.first_name).to eq("Nick")
      expect(person1.last_name).to eq("Edwin")
      expect(person2.first_name).to eq("Jane")
      expect(person2.last_name).to eq("Smith")
    end
  end
end
