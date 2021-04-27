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
end
