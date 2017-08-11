class MakeDistrictNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :shops, :district_id, :integer, null: true
  end
end
