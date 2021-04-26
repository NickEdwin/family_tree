class FamilyMember < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :gender,
                        :date_of_birth,
                        :date_of_death,
                        :place_of_birth

  belongs_to :family
end
