class AddDateOfDeathToFamilyMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :family_members, :date_of_death, :string
  end
end
