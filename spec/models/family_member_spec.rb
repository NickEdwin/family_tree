require 'rails_helper'

describe FamilyMember, type: :model do
  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :date_of_birth }
    it { should validate_presence_of :place_of_birth }
  end

  describe "relationships" do
    it {should belong_to :family}
  end
end
