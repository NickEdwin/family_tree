class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :family, references: :families, foreign_key: { to_table: :families}
      t.references :family_member_1, references: :family_members, foreign_key: { to_table: :family_members}
      t.references :family_member_2, references: :family_members, foreign_key: { to_table: :family_members}
      t.string :family_member_1_relationship_to_2
      t.string :family_member_2_relationship_to_1
      t.text :description

      t.timestamps
    end
  end
end
