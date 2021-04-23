class CreateFamilyMember < ActiveRecord::Migration[6.0]
  def change
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :date_of_birth
      t.string :place_of_birth
      t.references :family, null: false, foreign_key: true
    end
  end
end
