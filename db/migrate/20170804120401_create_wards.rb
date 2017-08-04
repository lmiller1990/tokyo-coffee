class CreateWards < ActiveRecord::Migration[5.1]
  def change
    create_table :wards do |t|
      t.string :japanese_name
      t.string :english_name

      t.timestamps
    end
  end
end
