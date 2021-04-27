class Family < ApplicationRecord
  validates_presence_of :family_name,
                        :family_description

  has_many :family_members
  has_many :relationships
end
