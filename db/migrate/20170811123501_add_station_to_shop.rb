class AddStationToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :station, :string
  end
end
