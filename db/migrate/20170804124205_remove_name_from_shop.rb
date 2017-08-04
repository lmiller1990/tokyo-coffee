class RemoveNameFromShop < ActiveRecord::Migration[5.1]
  def change
    remove_column :shops, :name, :string
  end
end
