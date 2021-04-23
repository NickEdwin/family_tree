class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.string :family_name
      t.text :family_description

      t.timestamps
    end
  end
end
