class CreateFacilitiesShopsJoinTable < ActiveRecord::Migration[5.1]
  def change
		create_join_table :shops, :facilities do |t|
			t.index :shop_id
			t.index :facility_id
		end
  end
end
