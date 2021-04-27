require 'rails_helper'

describe Relationship, type: :model do
  describe "validations" do
    it { should validate_presence_of :family_id }
    it { should validate_presence_of :family_member_1_id }
    it { should validate_presence_of :family_member_2_id }
    it { should validate_presence_of :family_member_1_relationship_to_2 }
    it { should validate_presence_of :family_member_2_relationship_to_1 }
  end

  describe "relationships" do
    it {should belong_to :family}
  end

  describe 'objects' do
    before(:each) do
      @family1 = Family.create!(family_name: "Edwin",
                                family_description: "A noble and wise family.")
      @nick = @family1.family_members.create!(first_name: "Nick",
                                                     last_name: "Edwin",
                                                     gender: "Male",
                                                     date_of_birth: "5/27/1985",
                                                     date_of_death: "n/a",
                                                     place_of_birth: "Staten Island, NY")
      @aimee = @family1.family_members.create!(first_name: "Aimee",
                                                     last_name: "Edwin",
                                                     gender: "Female",
                                                     date_of_birth: "3/21/1983",
                                                     date_of_death: "n/a",
                                                     place_of_birth: "Staten Island, NY")
      @relationship1 = Relationship.create!(family_id: @family1.id,
                                            family_member_1_id: @nick.id,
                                            family_member_2_id: @aimee.id,
                                            family_member_1_relationship_to_2: "Sister",
                                            family_member_2_relationship_to_1: "Brother",
                                            description: "The beautiful children of Jessica Edwin")
    end

    it "can create family member relationships" do
      expect(@relationship1.family_id).to eq(@family1.id)
      expect(@relationship1.family_member_1_id).to eq(@nick.id)
      expect(@relationship1.family_member_2_id).to eq(@aimee.id)

      bro = FamilyMember.find(@relationship1.family_member_1_id)
      expect(bro.first_name).to eq("Nick")

      sis = FamilyMember.find(@relationship1.family_member_2_id)
      expect(sis.first_name).to eq("Aimee")
    end
  end
end
