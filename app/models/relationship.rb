class Relationship < ApplicationRecord
  validates_presence_of :family_id,
                        :family_member_1_id,
                        :family_member_2_id,
                        :family_member_1_relationship_to_2,
                        :family_member_2_relationship_to_1

  belongs_to :family
  has_many :family_members
end
