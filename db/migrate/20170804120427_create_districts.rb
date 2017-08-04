class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :districts do |t|
      t.string :japanese_name
      t.string :english_name
      t.references :ward, foreign_key: true

      t.timestamps
    end
  end
end
