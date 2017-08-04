class AddEnglishAndJapaneseNamesToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :japanese_name, :string
    add_column :shops, :english_name, :string
  end
end
