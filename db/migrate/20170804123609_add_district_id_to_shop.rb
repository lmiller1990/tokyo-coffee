class AddDistrictIdToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :district_id, :integer, null: false
  end
end
